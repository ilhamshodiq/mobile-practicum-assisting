import 'package:flutter/material.dart';
import 'package:prakmobile_pertemuan7/model/reqresuser.dart';
import 'package:prakmobile_pertemuan7/viewmodel/services.dart';

class TestReqresPage extends StatefulWidget {
  const TestReqresPage({super.key});

  @override
  State<TestReqresPage> createState() => _TestReqresPageState();
}

class _TestReqresPageState extends State<TestReqresPage> {
  ReqresUser? reqresuser;
  bool isLoading = false;
  String id = '3';


  @override
  void initState() {
    super.initState();
    isLoading = true;
    getReqresUser(id).then((value) {
      reqresuser = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
              const Text('reqres test', style: TextStyle(color: Colors.black)),
        ),
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(reqresuser!.data.avatar)),
              Text(reqresuser!.data.firstName),
              Text(reqresuser!.data.lastName),
              Text(reqresuser!.data.email),             
            ],
          ),
        ));
  }
}
