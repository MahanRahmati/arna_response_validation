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
  String getDescriptionOfResponse(final Response? response) {
    if (response == null) {
      return 'Response is null';
    }

    return StatusCode.getDescriptionByCode(response.statusCode);
  }

  /// Get body of response;
  dynamic getBody(final Response? response) {
    if (response == null) {
      return null;
    }
    return response.body;
  }

  /// Get body of response;
  dynamic getUTF8Body(final Response? response) {
    if (response == null) {
      return null;
    }
    return utf8.decode(response.bodyBytes);
  }
}
