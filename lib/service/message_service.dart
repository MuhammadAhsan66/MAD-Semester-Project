import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageService {
  Future<void> sendMessage(String message, String name, String email) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final sendReport = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'service_id': 'service_6le4yxr',
            'template_id': 'template_vl1tqdq',
            'user_id': 'i_7orJCaj8ogRtgIZ',
            'template_params': {
              'from_name': name,
              'from_email': email,
              'message': message
            }
          }));
      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print(e);
    }
    await Future.delayed(const Duration(seconds: 3));
  }
}
