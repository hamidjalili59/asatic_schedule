import 'dart:convert';
import 'dart:io';

import 'package:asatic/features/core/models/model_with_parent_id.dart';
import 'package:asatic/features/counter/domain/models/counter.dart';
import 'package:asatic/features/counter/domain/use_case/change_counter_info_use_case.dart';
import 'package:asatic/features/counter/domain/use_case/create_counter_use_case.dart';
import 'package:asatic/features/counter/domain/use_case/get_all_counters_use_case.dart';
import 'package:asatic/features/counter/domain/use_case/get_counter_by_id_use_case.dart';
import 'package:asatic/features/locator.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final params = request.uri.queryParameters;

  Future<Response> getMethod() async {
    try {
      if (params.containsKey('id')) {
        final result = await locator
            .get<FindCounterByIdUseCase>()
            .call(int.tryParse(params['id'] ?? '') ?? 0);
        if (result.hasError()) {
          return Response(statusCode: HttpStatus.noContent, body: 'nabod');
        } else {
          return Response.json(
            body: result.getValue()?.toJson() ?? {'nashod': 'ridi'},
          );
        }
      } else {
        final result = await locator.get<FindAllCountersUseCase>().call(0);
        if (result.hasError()) {
          return Response(statusCode: HttpStatus.noContent, body: 'nabod');
        } else {
          return Response.json(
            body: result.getValue()?.map((e) => e?.toJson() ?? {}).toList() ??
                [
                  {'nashod': 'ridi'},
                ],
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
      final result = await locator.get<CreateCounterUseCase>().call(
            ModelWithParentId<Counter>(
              Counter.fromJson(requestJson['data'] as Map<String, dynamic>),
              requestJson['device_id'] as int,
            ),
          );
      if (result.hasError()) {
        return Response(statusCode: HttpStatus.badRequest);
      } else {
        return Response.json(body: requestJson);
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.unauthorized);
    }
  }

  Future<Response> putMethod() async {
    try {
      final requestJson =
          jsonDecode(await request.body()) as Map<String, dynamic>;
      final result = await locator.get<UpdateCounterInfoUseCase>().call(
            ModelWithParentId<Counter>(
              Counter.fromJson(requestJson),
              requestJson['parentId'] as int,
            ),
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
      return Response(statusCode: HttpStatus.methodNotAllowed);
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
