import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zyluinternship/emp.dart';
import 'package:zyluinternship/emp_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
  
    final catelogJson =
        await rootBundle.loadString("assets/files/employe.json");
      print("Data fetched successfully...");
    // await rootBundle.loadString("assets/files/catelog.json");

    // final response = await http.get(Uri.parse(url));
    // final catelogJson = response.body;
    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];
    EmpModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Employee Information"),
      ),
      body: Column(
        children: [
          if (EmpModel.items != null && EmpModel.items.isNotEmpty)
           const EmpList()
          else
           const Center(child:  CircularProgressIndicator()),
        ],
      ),
      // ListView.builder(itemBuilder:  (context, index) => ListTile(title: Text("Employee name"), leading: CircleAvatar(),trailing: Icon(Icons.access_alarms_outlined,color: Colors.black,size: 5,),subtitle: Text("tap to see employee details"),))
    );
  }
}
