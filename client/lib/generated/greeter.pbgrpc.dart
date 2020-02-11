///
//  Generated code. Do not modify.
//  source: greeter.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'greeter.pb.dart' as $0;
export 'greeter.pb.dart';

class GreeterClient extends $grpc.Client {
  static final _$hello = $grpc.ClientMethod<$0.Request, $0.Response>(
      '/Greeter/Hello',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  GreeterClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Response> hello($0.Request request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$hello, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'Greeter';

  GreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Response>(
        'Hello',
        hello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> hello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return hello(call, await request);
  }

  $async.Future<$0.Response> hello($grpc.ServiceCall call, $0.Request request);
}
