import 'dart:convert';
import 'dart:io';

import 'package:asatic/features/admin/domain/models/admin.dart';
import 'package:asatic/features/admin/domain/use_case/change_admin_info_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/create_admin_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/get_admin_by_id_use_case.dart';
import 'package:asatic/features/admin/domain/use_case/get_all_admin_use_case.dart';
import 'package:asatic/features/locator.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final params = request.uri.queryParameters;

  Future<Response> getMethod() async {
    try {
      if (params.containsKey('id')) {
        final result = await locator
            .get<FindAdminByIdUseCase>()
            .call(int.tryParse(params['id'] ?? '') ?? 0);
        if (result.hasError()) {
          return Response(statusCode: HttpStatus.noContent, body: 'nabod');
        } else {
          return Response.json(
            body: result.getValue()?.toJson() ?? {'nashod': 'ridi'},
          );
        }
      } else {
        final result = await locator.get<FindAllAdminsUseCase>().call(0);
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
      final result = await locator.get<CreateAdminUseCase>().call(
            Admin.fromJson(requestJson),
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
      final result = await locator.get<UpdateAdminInfoUseCase>().call(
            Admin.fromJson(requestJson),
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
