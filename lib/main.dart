import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sms/sms.dart';

void main() {
  runApp(new MaterialApp(
    title: "پیام رسان تستی",
    home: new SendSms(),
  ));
}


class SendSms extends StatefulWidget {
  @override
  _SendSmsState createState() => new _SendSmsState();
}

class _SendSmsState extends State<SendSms> {

  SmsSender sender = new SmsSender();
  String address = "09158657190";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _sendSMS() async {
    sender.sendSms(new SmsMessage(address, 'سلام از فلاتر'));

    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) => _showSnackBar(msg.body));
  }

  _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: Scaffold(
            key: _scaffoldKey,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(' ارسال پیام به شماره 09158657190'),
                  Text('  :)متن پیام: سلام از فلاتر '),
                  RaisedButton(onPressed: () => _sendSMS(),
                      child: const Text("ارسال پیام"))
                ],
              ),
            )
        )
    );
  }
}