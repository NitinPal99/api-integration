import 'package:api_integration/core/constant/app_colors.dart';
import 'package:api_integration/data/model/List_model.dart';
import 'package:api_integration/data/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  bool isReady = false;
  List<ListModel>? userDataList = [];

  @override
  void initState() {
    isReady = true;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      userDataList = await ApiServices().getListData();
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Data: ${userDataList}");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("User Data"),
        ),
        body: isReady == true || userDataList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: userDataList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? Text(
                                "PostId: ${userDataList![index].postId.toString()}",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            : index == 4
                                ? const SizedBox()
                                : userDataList![index - 1].postId !=
                                        userDataList![index].postId
                                    ? Text(
                                        "PostId: ${userDataList![index].postId.toString()}",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const SizedBox(),
                        Text(
                          "Id: ${userDataList![index].id}",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Name: ",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                                children: [
                              TextSpan(
                                  text: userDataList![index].name,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal)),
                            ])),
                        RichText(
                            text: TextSpan(
                                text: "Email: ",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                                children: [
                              TextSpan(
                                  text: userDataList![index].email,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal)),
                            ])),
                        RichText(
                            text: TextSpan(
                                text: "Body: ",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                                children: [
                              TextSpan(
                                  text: userDataList![index].body,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal)),
                            ]))
                      ],
                    ),
                  );
                }));
  }
}
