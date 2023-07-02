// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/constant/network_constants.dart';
import 'package:pokemon_app/infrastructure/types/api_result.dart';
import 'package:pokemon_app/infrastructure/types/base_exception.dart';
import 'package:pokemon_app/infrastructure/types/exception/session_exception.dart';
import 'package:pokemon_app/infrastructure/types/json.dart';


class MockedResult {
  final JSON result;
  final int statusCode;
  final Map<String, String> headers;

  const MockedResult(
      {this.result, this.statusCode = 200, this.headers = const {}});
}

enum HttpRequestType {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  final String value;
  const HttpRequestType(this.value);
}

abstract class BaseHttpClient {
  final String baseURL;

  const BaseHttpClient(this.baseURL);

  String buildFullUrl(String extraPath);

  Future<APIResult<T>> post<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? bearerToken,
      JSON? query,
      bool shouldPrint = false,
      MockedResult? mockResult});

  Future<APIResult<T>> get<T>(
      {required String path,
      Map<String, String>? headers,
      required MapFromJSON<T> mapper,
      JSON? query,
      bool shouldPrint = false,
      String? bearerToken,
      MockedResult? mockResult});

  Future<APIResult<T>> delete<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? bearerToken,
      JSON? query,
      bool shouldPrint = false,
      MockedResult? mockResult});

  Future<APIResult<T>> put<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? bearerToken,
      JSON? query,
      bool shouldPrint = false,
      MockedResult? mockResult});

  Future<APIResult<T>> multipartRequest<T>({
    required String path,
    required HttpRequestType requestType,
    required MapFromJSON<T> mapper,
    Map<String, String>? headers,
    required List<MultipartRequestBody> body,
    String? bearerToken,
    query,
    bool shouldPrint = false,
    MockedResult? mockResult,
  });
}

@LazySingleton(as: BaseHttpClient)
class RknHttpClient implements BaseHttpClient {
  @override
  Future<APIResult<T>> post<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      JSON? query,
      String? bearerToken,
      bool shouldPrint = false,
      MockedResult? mockResult}) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = _buildHeader(headers, bearerToken);
      final response = mockResult != null
          ? _mockResult(mockResult)
          : await http.post(
              uri,
              headers: finalHeader,
              body: jsonEncode(body),
            );
      final result = _handleResponse(response, mapper, shouldPrint, path,
          headers: finalHeader, body: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<APIResult<T>> get<T>({
    required String path,
    Map<String, String>? headers,
    required MapFromJSON<T> mapper,
    MockedResult? mockResult,
    JSON? query,
    String? bearerToken,
    bool shouldPrint = false,
  }) async {
    final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
    final finalHeader = _buildHeader(headers, bearerToken);
    final response = mockResult != null
        ? _mockResult(mockResult)
        : await http.get(
            uri,
            headers: finalHeader,
          );
    return _handleResponse(response, mapper, shouldPrint, path,
        headers: finalHeader);
  }

  @override
  Future<APIResult<T>> delete<T>({
    required String path,
    required MapFromJSON<T> mapper,
    Map<String, String>? headers,
    body,
    String? bearerToken,
    query,
    bool shouldPrint = false,
    MockedResult? mockResult,
  }) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = _buildHeader(headers, bearerToken);
      final response = mockResult != null
          ? _mockResult(mockResult)
          : await http.delete(
              uri,
              headers: finalHeader,
              body: jsonEncode(body),
            );
      final result = _handleResponse(
        response,
        mapper,
        shouldPrint,
        path,
        headers: finalHeader,
        body: body,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<APIResult<T>> put<T>({
    required String path,
    required MapFromJSON<T> mapper,
    Map<String, String>? headers,
    body,
    String? bearerToken,
    query,
    bool shouldPrint = false,
    MockedResult? mockResult,
  }) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = _buildHeader(headers, bearerToken);
      final response = mockResult != null
          ? _mockResult(mockResult)
          : await http.put(
              uri,
              headers: finalHeader,
              body: jsonEncode(body),
            );
      final result = _handleResponse(response, mapper, shouldPrint, path,
          headers: finalHeader, body: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<APIResult<T>> multipartRequest<T>({
    required String path,
    required HttpRequestType requestType,
    required MapFromJSON<T> mapper,
    Map<String, String>? headers,
    required List<MultipartRequestBody> body,
    String? bearerToken,
    query,
    bool shouldPrint = false,
    MockedResult? mockResult,
  }) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = {
        if (headers != null) ...headers,
        if (bearerToken != null) 'Authorization': 'Bearer $bearerToken'
      };
      http.Response response;
      if (mockResult != null) {
        response = _mockResult(mockResult);
      } else {
        final request = http.MultipartRequest(requestType.value, uri);
        request.headers.addAll(finalHeader);
        for (var file in body) {
          request.files
              .add(await http.MultipartFile.fromPath(file.key, file.filePath));
        }
        var streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      }

      final bodyRequest = {"data": body};
      final result = _handleResponse(response, mapper, shouldPrint, path,
          headers: finalHeader, body: bodyRequest);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, String> _buildHeader(
      Map<String, dynamic>? headers, String? bearerToken) {
    return {
      "Accept": "application/json",
      if (headers != null) ...headers,
      if (bearerToken != null) 'Authorization': 'Bearer $bearerToken'
    };
  }

  APIResult<T> _handleResponse<T>(
    http.Response response,
    MapFromJSON<T> mapper,
    bool shouldPrint,
    String url, {
    Map<String, String>? headers,
    JSON? body,
  }) {
    if (shouldPrint) {
      _printResponse(response, url, headers: headers, requestBody: body);
    }
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final mappedData = mapper(result);
      return APIResult<T>(
          code: response.statusCode, data: mappedData, message: 'Success fetch data');
    }
    if (response.statusCode == 401) {
      throw SessionException(result['status_message']);
    }
    
    if (response.statusCode == 404) {
      throw BaseException(result['status_message']);
    }
    throw BaseException.unknownError();
  }

  void _printResponse(http.Response response, String url,
      {Map<String, dynamic>? requestBody, Map<String, String>? headers}) {
    if (kReleaseMode) return;
    debugPrint("====^^^^^^^^^^^^^^^===");
    debugPrint("URL : ${buildFullUrl(url)}");
    debugPrint("Method : ${response.request?.method}");
    if (requestBody != null) {
      debugPrint("====== Headers =====");
      _printJSONSafely(jsonEncode(headers));
    }
    if (requestBody != null) {
      debugPrint("====== Request Body =====");
      _printJSONSafely(jsonEncode(requestBody));
    }
    debugPrint("Status Code : ${response.statusCode}");
    debugPrint("====== Response Body =====");
    _printJSONSafely(response.body);
    debugPrint("===vvvvvvvvvvvvvvvvv==");
  }

  void _printJSONSafely(String body) {
    try {
      if (body.isEmpty) {
        debugPrint("Empty Body");
      } else {
        JsonDecoder decoder = const JsonDecoder();
        final object = decoder.convert(body);
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        String prettyprint = encoder.convert(object);
        prettyprint.split('\n').forEach((element) => debugPrint(element));
      }
    } catch (e) {
      debugPrint("UnFormatted");
      debugPrint(body);
    }
  }

  http.Response _mockResult(MockedResult mockedResult) {
    return http.Response(
        jsonEncode(mockedResult.result), mockedResult.statusCode,
        headers: mockedResult.headers);
  }

  @override
  String get baseURL => NetworkConstants.apiBaseUrl;

  @override
  String buildFullUrl(String extraPath) => "$baseURL$extraPath";
}

class MultipartRequestBody {
  final String filePath;
  final String key;
  MultipartRequestBody({
    required this.filePath,
    required this.key,
  });

  Map<String, dynamic> toJson() => {"key": key, "filePath": filePath};

  @override
  String toString() {
    return '''
    {
      key:$key,
      filePath:$filePath
    }
    ''';
  }
}

class RknHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}