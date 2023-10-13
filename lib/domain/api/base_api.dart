import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_test/domain/config/config.dart';
import 'package:my_test/domain/config/request_type.dart';
import 'package:my_test/domain/config/routes.dart';

class BaseAPI {
  Map<String, String> _getHeader() => {
        "Content-Type": "application/json",
        "Accept": "*/*",
      };

  String _getUrl(Routes route) => "${Config.base}/${route.url}";

  String _getBody(dynamic body) => jsonEncode(body);

  Future<TResponse?> _createRequest<TResponse>({
    required Routes route,
    dynamic body,
    dynamic query,
    required HttpRequestType requestType,
  }) async {
    try {
      _debugPrint("${requestType.type} ${route.url}");
      var url = _getUrl(route);
      var headers = _getHeader();
      var dio = Dio(
        BaseOptions(
          responseType: ResponseType.json,
          baseUrl: Config.base,
          headers: headers,
          method: requestType.type,
        ),
      );

      var response = await dio.request<TResponse>(
        url,
        data: _getBody(body),
        queryParameters: query,
        options: Options(
          method: requestType.type,
        ),
      );
      _debugPrint("response: ${response.data}");
      return response.data;
    } on DioException catch (ex) {
      _debugPrint("Dio error: ${ex.response?.data}");
    } catch (ex) {
      _debugPrint(ex);
    }
    return null;
  }

  void _debugPrint(dynamic object) {
    debugPrint(object);
  }

  Future<TResponse?> get<TResponse>({
    required Routes route,
    dynamic query,
  }) async =>
      _createRequest(
        requestType: HttpRequestType.get,
        route: route,
        query: query,
      );
}
