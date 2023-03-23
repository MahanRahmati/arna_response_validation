<p align="center">
  <a href="https://pub.dartlang.org/packages/arna_response_validation"><img src="https://img.shields.io/pub/v/arna_response_validation.svg" alt="pub.dev"></a>
  <a href="https://github.com/MahanRahmati/"><img src="https://img.shields.io/badge/Maintainer-MahanRahmati-informational"></a>
  <a href="https://github.com/MahanRahmati/arna_response_validation/actions/workflows/pana_analysis.yml"><img src="https://github.com/MahanRahmati/arna_response_validation/actions/workflows/pana_analysis.yml/badge.svg"></a>
  <a href="https://github.com/MahanRahmati/arna_response_validation/actions/workflows/flutter_analysis.yml"><img src="https://github.com/MahanRahmati/arna_response_validation/actions/workflows/flutter_analysis.yml/badge.svg"></a>
  <img src="https://img.shields.io/github/license/MahanRahmati/arna_response_validation">
</p>

## Introduction

A simple and powerful HTTP validator for Flutter.

## Getting Started

Add Arna Response Validation as a dependency in your pubspec.yaml:

```yaml
dependencies:
  arna_response_validation: ^1.0.1
```

Import it:

```dart
import 'package:arna_response_validation/arna_response_validation.dart';
```

Use it!

```dart
final Response? response = await webService.get(
  Uri.parse('https://api.ipify.org'),
);
final body = validateResponse(response);
arnaLogger(title: 'Your IP', data: body);

dynamic validateResponse(final Response? response) {
  final StatusCode? statuscode = ArnaResponseValidation().getStatusCode(response);
  if (statuscode != null) {
    arnaLogger(title: 'StatusCode', data: statuscode);
    return ArnaResponseValidation().getBody(response);
  }
  return null;
}

```
