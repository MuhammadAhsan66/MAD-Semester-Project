import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metro_ticketing/controller/message_controller.dart';
import 'package:email_validator/email_validator.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({Key? key}) : super(key: key);

  @override
  _SendMessageWidgetState createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late MessageController _messageController;
  late FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    _focusNode = FocusNode();
    _messageController = Provider.of<MessageController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            height: 400,
            width: 400,
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: Colors.grey[300]!)
                ]),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Contact Us',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextFormField(
                    focusNode: _focusNode,
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Required*';
                      } else if (!EmailValidator.validate(email)) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Message'),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 45,
                    width: 110,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: const Color(0xff151534),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () => _sendMessage(_controller.text,
                          nameController.text, emailController.text),
                      child: const Text('Send', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _sendMessage(String message, String name, String email) async {
    if (message != "") {
      _messageController.startSendingMessage();
      _controller.clear();
      nameController.clear();
      emailController.clear();
      _focusNode.unfocus();
      await _messageController.sendMessage(message, name, email);
      Navigator.of(context).pop(true);
    }
  }
}
