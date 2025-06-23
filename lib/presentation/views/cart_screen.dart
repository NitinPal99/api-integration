import 'package:api_integration/core/constant/app_colors.dart';
import 'package:api_integration/data/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isReady = false;
  List<dynamic> allCartData = [];
  List<dynamic> cartData = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // cartData = await ApiServices().getCart();
      allCartData = await ApiServices().getCart();
      // cartData = List.from(allCartData);
      cartData = allCartData;

      setState(() {});
      print("Cart Model ${cartData}");
    });
  }

  //
  void filterProducts(String query) {
    if (query.isEmpty) {
      // cartData = List.from(allCartData);
      cartData = allCartData;
    } else {
      cartData = allCartData
          .map((cart) {
            List<dynamic> filteredProducts = cart["products"]
                .where((product) => product["title"]
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
                .toList();
            if (filteredProducts.isNotEmpty) {
              return {
                ...cart,
                "products": filteredProducts,
              };
            }
            return null;
          })
          .where((element) => element != null)
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart Data"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    filterProducts(value);
                  },
                  decoration: InputDecoration(
                      hintText: "Search by name",
                      prefixIcon: const Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              const BorderSide(color: AppColors.greyColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              const BorderSide(color: AppColors.greyColor))),
                ),
                isReady == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          color: AppColors.greyColor2,
                        ),
                        itemCount: cartData.length,
                        itemBuilder: (context, index) {
                          List<dynamic> products = cartData[index]["products"];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cart ID: ${cartData[index]["id"]}",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.h),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: products.length,
                                  itemBuilder: (context, productIndex) {
                                    var product = products[productIndex];
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 35.r,
                                            backgroundImage: NetworkImage(
                                                product["thumbnail"]
                                                    .toString()),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product["title"].toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                    "Quantity: ${product["quantity"]}"),
                                                Text(
                                                    "Price: ${product["price"]}"),
                                                Text(
                                                    "Total: ${product["total"]}"),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ));
  }
}
