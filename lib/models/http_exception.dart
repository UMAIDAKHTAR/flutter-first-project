import "package:flutter/material.dart";

class HttpException implements Exception {
  String message;
  HttpException(this.message);
  String tostring() {
    return message;
  }
}
