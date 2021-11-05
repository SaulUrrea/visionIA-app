// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';

// TODO import Dialogflow
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  bool _isRecording = false;

  final RecorderStream _recorder = RecorderStream();
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>> _audioStreamSubscription;
  late BehaviorSubject<List<int>> _audioStream;

  // TODO DialogflowGrpc class instance
  late DialogflowGrpcV2Beta1 dialogflow;

  @override
  void initState() {
    try {
      super.initState();
      initPlugin();
    } catch (err) {
      print('initState|err| $err');
    }
  }

  @override
  void dispose() {
    try {
      _recorderStatus.cancel();
      _audioStreamSubscription.cancel();
      super.dispose();
    } catch (err) {
      print('dispose|err| $err');
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    try {
      _recorderStatus = _recorder.status.listen((status) {
        if (mounted) {
          setState(() {
            _isRecording = status == SoundStreamStatus.Playing;
          });
        }
      });

      await Future.wait([_recorder.initialize()]);

      // TODO Get a Service account
      // Get a Service account
      final serviceAccount = ServiceAccount.fromString(
          '${(await rootBundle.loadString('assets/models/chatbot/credentials.json'))}');
      // Create a DialogflowGrpc Instance
      dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    } catch (err) {}
  }

  void stopStream() async {
    try {
      await _recorder.stop();
      await _audioStreamSubscription.cancel();
      await _audioStream.close();
    } catch (err) {
      print('stopStream|err| $err');
    }
  }

  void handleSubmitted(text) async {
    try {
      print(text);
      _textController.clear();

      //TODO Dialogflow Code
      ChatMessage message = ChatMessage(
        text: text,
        name: "Usuario",
        type: true,
      );

      setState(() {
        _messages.insert(0, message);
      });

      //Error que genera la no devolucion del mensaje del bot.
      DetectIntentResponse data = await dialogflow.detectIntent(text, 'en-US');
      //--------

      String fulfillmentText = data.queryResult.fulfillmentText;
      if (fulfillmentText.isNotEmpty) {
        ChatMessage botMessage = ChatMessage(
          text: fulfillmentText,
          name: "Bot",
          type: false,
        );

        setState(() {
          _messages.insert(0, botMessage);
        });
      }
    } catch (err) {
      print('handleSubmitted|error| $err');
    }
  }

  void handleStream() async {
    try {
      _recorder.start();

      _audioStream = BehaviorSubject<List<int>>();
      _audioStreamSubscription = _recorder.audioStream.listen((data) {
        print(data);
        _audioStream.add(data);
      });

      // TODO Create SpeechContexts
      // Create an audio InputConfig
      var biasList = SpeechContextV2Beta1(phrases: [
        'Dialogflow CX',
        'Dialogflow Essentials',
        'Action Builder',
        'HIPAA'
      ], boost: 20.0);

      // See: https://cloud.google.com/dialogflow/es/docs/reference/rpc/google.cloud.dialogflow.v2#google.cloud.dialogflow.v2.InputAudioConfig
      var config = InputConfigV2beta1(
          encoding: 'AUDIO_ENCODING_LINEAR_16',
          languageCode: 'en-US',
          sampleRateHertz: 16000,
          singleUtterance: false,
          speechContexts: [biasList]);

      // TODO Make the streamingDetectIntent call, with the InputConfig and the audioStream
      // TODO Get the transcript and detectedIntent and show on screen

      final responseStream =
          dialogflow.streamingDetectIntent(config, _audioStream);
      // Get the transcript and detectedIntent and show on screen
      responseStream.listen((data) {
        //print('----');
        setState(() {
          //print(data);
          String transcript = data.recognitionResult.transcript;
          String queryText = data.queryResult.queryText;
          String fulfillmentText = data.queryResult.fulfillmentText;

          if (fulfillmentText.isNotEmpty) {
            ChatMessage message = ChatMessage(
              text: queryText,
              name: "Usuario",
              type: true,
            );

            ChatMessage botMessage = ChatMessage(
              text: fulfillmentText,
              name: "Bot",
              type: false,
            );

            _messages.insert(0, message);
            _textController.clear();
            _messages.insert(0, botMessage);
          }
          if (transcript.isNotEmpty) {
            _textController.text = transcript;
          }
        });
      }, onError: (e) {
        //print(e);
      }, onDone: () {
        //print('done');
      });
    } catch (err) {
      print('handleStream|err| $err');
    }
  }

  // The chat interface
  //
  //--------------  ----------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Bot"),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        const Divider(height: 1.0),
        Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).accentColor),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _textController,
                        onSubmitted: handleSubmitted,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Enviar un mensaje"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () => handleSubmitted(_textController.text),
                      ),
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(_isRecording ? Icons.mic_off : Icons.mic),
                      onPressed: _isRecording ? stopStream : handleStream,
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }
}

//------------------------------------------------------------------------------------
// The chat message balloon
//
//------------------------------------------------------------------------------------
class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {required this.text, required this.name, required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(child: Text('B')),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(name, style: Theme.of(context).textTheme.subtitle1),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
            child: Text(
          name[0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
