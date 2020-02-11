// Copyright (c) 2018, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Dart implementation of the gRPC helloworld.Greeter client.
import 'dart:async';

import 'package:grpc/grpc.dart';

import 'package:helloworld/generated/greeter.pb.dart';
import 'package:helloworld/generated/greeter.pbgrpc.dart';

import 'package:flutter/material.dart';

Future<String> greeting() async {
  final channel = ClientChannel('go.micro.srv.greeter',
      port: 43685,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GreeterClient(channel);

  try {
    final response = await stub.hello(Request()..name = "World!");
    await channel.shutdown();
    return 'Greeter client received: ${response.greeting}';
  } catch (e) {
    await channel.shutdown();
    return 'Caught error: $e';
  }
}


void main() => runApp(MyApp());


class Greeting extends StatefulWidget {
  @override
  GreetingState createState() => GreetingState();
}


class GreetingState extends State<Greeting> {

    var _txt;
    @override
    void initState() {
        // This is the proper place to make the async calls
        // This way they only get called once

        // During development, if you change this code,
        // you will need to do a full restart instead of just a hot reload
        
        // You can't use async/await here,
        // We can't mark this method as async because of the @override
        greeting().then((result) {
            // If we need to rebuild the widget with the resulting data,
            // make sure to use `setState`
            setState(() {
                _txt = result;
            });
        });
    }

  @override
  Widget build(BuildContext context) {

    return Text(_txt);
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Greeting(),
        ),
      ),
    );
  }
}