import 'package:flutter/material.dart';
import 'package:myapp/model/userModel.dart';
import 'package:myapp/service/services.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  Data? users;

  bool? isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    Services.fetchData().then((value) {
      setState(() {
        users = value!;
        print(users);
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('SupportPage'),
      ),
      body: isLoading!
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: deviceHeight * 0.30,
              width: deviceWidth,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Text(
                    'Hey :${users!.support.text} ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Text(
                    'For site visit :${users!.support.url} ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
