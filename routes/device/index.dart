import 'dart:convert';
import 'dart:io';

import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/device/domain/models/device.dart';
import 'package:asatic/features/device/domain/use_case/change_device_info_use_case.dart';
import 'package:asatic/features/device/domain/use_case/create_device_use_case.dart';
import 'package:asatic/features/device/domain/use_case/delete_device_use_case.dart';
import 'package:asatic/features/device/domain/use_case/get_all_devices_use_case.dart';
import 'package:asatic/features/device/domain/use_case/get_device_by_id_use_case.dart';
import 'package:asatic/features/locator.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final params = request.uri.queryParameters;

  Future<Response> getMethod() async {
    try {
      if (params.containsKey('id')) {
        final result = await locator
            .get<FindDeviceByIdUseCase>()
            .call(int.tryParse(params['id'] ?? '') ?? 0);
        if (result.hasError()) {
          return Response(statusCode: HttpStatus.noContent, body: 'nabod');
        } else {
          return Response.json(
            body: result.getValue()?.toJson() ?? {'json': 'null'},
          );
        }
      } else {
        final result = await locator.get<FindAllDevicesUseCase>().call(0);
        if (result.hasError()) {
          return Response(statusCode: HttpStatus.noContent, body: 'nabod');
        } else {
          return Response.json(
            body:
                result.getValue()?.map((e) => e?.toJson() ?? {}).toList() ?? [],
          );
        }
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.unauthorized, body: e.toString());
    }
  }

  Future<Response> postMethod() async {
    try {
      final requestJson =
          jsonDecode(await request.body()) as Map<String, dynamic>;
      final result = await locator.get<CreateDeviceUseCase>().call(
            ModelWithParentId<Device>(
              Device.fromJson(requestJson['data'] as Map<String, dynamic>),
              requestJson['parentId'] as int,
            ),
          );
      if (result.hasError()) {
        return Response(statusCode: HttpStatus.badRequest);
      } else {
        return Response.json(
          body: requestJson,
        );
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.unauthorized);
    }
  }

  Future<Response> deleteMethod() async {
    try {
      final requestJson =
          jsonDecode(await request.body()) as Map<String, dynamic>;
      final result = await locator.get<DeleteDeviceUseCase>().call(
            ModelWithParentId<int>(
              requestJson['data'] as int,
              requestJson['parentId'] as int,
            ),
          );
      if (result.hasError()) {
        return Response(statusCode: HttpStatus.badRequest);
      } else {
        return Response.json(
          body: requestJson,
        );
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.unauthorized);
    }
  }

  Future<Response> putMethod() async {
    try {
      final requestJson =
          jsonDecode(await request.body()) as Map<String, dynamic>;
      final result = await locator.get<UpdateDeviceInfoUseCase>().call(
            Device.fromJson(requestJson),
          );
      if (result.hasError()) {
        return Response(statusCode: HttpStatus.badRequest);
      } else {
        return Response.json(
          statusCode: HttpStatus.accepted,
          body: requestJson,
        );
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.unauthorized);
    }
  }

  // request
  switch (request.method) {
    case HttpMethod.get:
      return getMethod();
    case HttpMethod.post:
      return postMethod();
    case HttpMethod.delete:
      return deleteMethod();
    case HttpMethod.head:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.options:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.patch:
      return Response(statusCode: HttpStatus.methodNotAllowed);
    case HttpMethod.put:
      return putMethod();
  }
}
