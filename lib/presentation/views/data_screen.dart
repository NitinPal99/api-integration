import 'package:api_integration/data/model/multiple_post_model.dart';
import 'package:api_integration/data/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool isReady = false;
  List<MultiplePostModel> multiplePostModel = [];
  _getPost() {
    isReady = true;
    ApiServices().getPostWithModel().then((value) {
      if (value != null) {
        setState(() {
          multiplePostModel = value;
          isReady = false;
        });
      } else {
        setState(() {
          isReady = false;
        });
      }
    });
  }

  @override
  void initState() {
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Multiple Data"),
      ),
      body: isReady == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: multiplePostModel.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10.r),
                  child: ListTile(
                    leading: Text(multiplePostModel[index].id.toString()),
                    title: Text(
                      multiplePostModel[index].title.toString(),
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(multiplePostModel[index].body.toString()),
                  ),
                );
              }),
    );
  }
}
