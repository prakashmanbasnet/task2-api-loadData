import 'package:flutter/material.dart';
import 'package:myapp/model/userModel.dart';
import 'package:myapp/service/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
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
        title: Text('Detail Information'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: isLoading!
          ? SingleChildScrollView()
          : Container(
              height: deviceHeight,
              width: deviceWidth,
              child: ListView.builder(
                  itemCount: users!.data.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                        height: deviceHeight * 0.30,
                        width: deviceWidth,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                            left: deviceWidth * 0.10, top: deviceHeight * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: CachedNetworkImage(
                                imageUrl: users!.data[index].avatar,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.03,
                            ),
                            Text(
                              'Email :${users!.data[index].email} ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'FirstName :${users!.data[index].firstName} ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'LastName :${users!.data[index].lastName} ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]);
                  })),
    );
  }
}
