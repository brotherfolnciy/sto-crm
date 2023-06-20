import 'package:dio/dio.dart';

InterceptorsWrapper get sidInterceptor => InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters.addAll(
          {'SID': '10813_0c0a9a2f86eab09196705a274378b64a'},
        );

        handler.next(options);
      },
    );
