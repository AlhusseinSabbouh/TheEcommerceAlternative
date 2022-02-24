
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../core/view_model/home_view_model.dart';
import '../widget/custom_text.dart';

class HomeView extends StatelessWidget {
  List<String> categoryName = <String>['smen', 's', 's', 's', 's', 's'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: ListView(children: [
                Padding(
                  padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: Column(
                    children: [
                      _seachTextFormField(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(text: "categories", fontSize: 14),
                      SizedBox(
                        height: 20,
                      ),
                      _categoryList(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Best Selling", fontSize: 18),
                          CustomText(text: "See all", fontSize: 14)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _bestSellingList(),
                      GetBuilder<HomeViewModel>(
                        builder: (controller) => ElevatedButton(
                            onPressed: () {
                              controller.getAllCategories();
                            },
                            child: Text("fetch data")),
                      )
                    ],
                  ),
                ),
              ]),
            ),
    );
  }

  Widget _seachTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _categoryList() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 60,
                    height: 60,
                    child: Image.network(controller.categories[index].image),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.grey.shade400),
                  ),
                  CustomText(
                      text: controller.categories[index].name, fontSize: 15)
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 20,
              );
            },
            itemCount: controller.categoryLength),
      ),
    );
  }

  Widget _bestSellingList() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.grey.shade200),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Image.network(
                      controller.product[index].image,
                      height: 160,
                      width: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.product[index].name,
                      fontSize: 20,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    CustomText(text: "Tag Hour fdsf sdfsf", fontSize: 17),
                    SizedBox(
                      height: 4,
                    ),
                    CustomText(
                      text: "\$ ${controller.product[index].price}",
                      fontSize: 17,
                      color: mainColor,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 20,
              );
            },
            itemCount: controller.prodLength),
      ),
    );
  }
}
