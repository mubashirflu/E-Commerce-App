import 'package:flutter/material.dart';
import 'package:pratice_language_app/models/category.dart';
import 'package:pratice_language_app/models/product_model.dart';
import 'package:pratice_language_app/widgets/home_appBar.dart';
import 'package:pratice_language_app/widgets/image_slider.dart';
import 'package:pratice_language_app/widgets/product_cart.dart';
import 'package:pratice_language_app/widgets/search_bar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentslide = 0;
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectCatogeries = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const Custome_app_bar(),
              const SizedBox(height: 20.0),
              const Search_Bar(),
              const SizedBox(height: 20.0),
              Image_Slider(
                currentSlide: currentslide,
                onChange: (value) {
                  setState(
                    () {
                      currentslide = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectindex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectindex == index
                                ? Colors.blue[200]
                                : Colors.transparent),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(categories[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              categories[index].title,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                ],
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.78,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: selectCatogeries[selectindex].length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: selectCatogeries[selectindex][index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
