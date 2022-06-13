import 'package:flutter/material.dart';
import 'package:metro_ticketing/service/message_service.dart';

class MessageController extends ChangeNotifier {
  bool sendingMessage = false;
  final MessageService _messageService = MessageService();

  void startSendingMessage() {
    sendingMessage = true;
    notifyListeners();
  }

  Future<void> sendMessage(String message, String name, String email) async {
    await _messageService.sendMessage(message, name, email);
    sendingMessage = false;
  }
}
