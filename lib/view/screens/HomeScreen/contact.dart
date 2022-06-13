import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metro_ticketing/controller/message_controller.dart';
import 'send_message_widget.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Consumer<MessageController>(
        builder: (context, messageController, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              messageController.sendingMessage
                  ? _loadingContainer()
                  : const SendMessageWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget _loadingContainer() {
    return AlertDialog(
      title: const Text("Message sent."),
      content: const Text(
          "Thanks!\n\nIf you have any more questions, comments, or concerns or compliments, please feel welcome to tell us again."),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        )
      ],
    );
  }
}
