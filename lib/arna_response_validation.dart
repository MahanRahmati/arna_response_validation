/// Arna Response Validation is a simple and powerful HTTP validator for Flutter.
library arna_web_service;

import 'dart:convert';

import 'package:arna_response_validation/status_code.dart';
import 'package:http/http.dart';

export 'package:arna_response_validation/status_code.dart';

/// Tools to work with HTTP response.
class ArnaResponseValidation {
  /// Get status code of response.
  StatusCode? getStatusCode(final Response? response) {
    if (response == null) {
      return null;
    }
    return StatusCode.getByCode(response.statusCode);
  }

  /// Get description of response's status code.
  String? getDescriptionOfResponse(final Response? response) {
    if (response == null) {
      return 'Response is null';
    }

    return StatusCode.getDescriptionByCode(response.statusCode);
  }

  /// Get body of response.
  dynamic getBody(final Response? response) {
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      return null;
    }
    return response?.body;
  }

  /// Get body of a successful response.
  dynamic getSuccessfulBody(final Response? response) {
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      throw Exception('StatusCode is null');
    }
    if (!statusCode.isSuccess()) {
      throw Exception(response?.body);
    }
    return response?.body;
  }

  /// Get UTF-8 body of response.
  dynamic getUTF8Body(final Response? response) {
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      return null;
    }
    return utf8.decode(response?.bodyBytes ?? <int>[]);
  }

  /// Get UTF-8 body of a successful response.
  dynamic getSuccessfulUTF8Body(final Response? response) {
    final StatusCode? statusCode = getStatusCode(response);
    if (statusCode == null) {
      throw Exception('StatusCode is null');
    }
    if (!statusCode.isSuccess()) {
      throw Exception(response?.body);
    }
    return utf8.decode(response?.bodyBytes ?? <int>[]);
  }
}
