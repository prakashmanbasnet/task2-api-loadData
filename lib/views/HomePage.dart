import 'package:flutter/material.dart';
import 'package:myapp/model/userModel.dart';
import 'package:myapp/service/services.dart';
import 'package:myapp/views/DataPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text('Homepage')),
          ),
          body: isLoading!
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: Column(
                  children: [
                    Container(
                      height: deviceHeight * 0.10,
                      color: Colors.blue[100],
                      child: Center(
                        child: Text(
                          'page:${users!.page.toString()}',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: deviceHeight * 0.10,
                      color: Colors.blue[100],
                      child: Center(
                        child: Text(
                          'perPage:${users!.perPage}',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: deviceHeight * 0.10,
                      color: Colors.blue[100],
                      child: Center(
                        child: Text(
                          'total:${users!.total.toString()}',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: deviceHeight * 0.10,
                      color: Colors.blue[100],
                      child: Center(
                        child: Text(
                          'totalPages:${users!.totalPages.toString()}',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/users');
                      },
                      child: Container(
                        height: deviceHeight * 0.10,
                        color: Colors.blue[100],
                        child: Center(
                          child: Text(
                            'Get userData',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/support');
                      },
                      child: Container(
                        height: deviceHeight * 0.10,
                        color: Colors.blue[100],
                        child: Center(
                          child: Text(
                            'Support',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
    );
  }
}
