import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/details.dart';

import '../constant/color.dart';
import '../provider/travel.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pin.png',
                width: 20,
              ),
              const SizedBox(width: 2),
              const Text(
                'London',
                style: TextStyle(color: colorVar),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: colorVar,
              ),
            ],
          ),
          // centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/menu.png',
              width: 20,
            ),
          ),
          actions: const [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile.png',
                ),
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Discover ',
                  style: TextStyle(
                    color: colorVar,
                    fontSize: 31,
                  ),
                  children: [
                    TextSpan(
                      text: 'the Best Places to Travel',
                      style: TextStyle(
                        fontSize: 31,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Search Places',
                  fillColor: const Color.fromARGB(255, 221, 215, 215),
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/option.png',
                      width: 1,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/search.png',
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Nearest to you',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: colorVar,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: TravelData.getNearestItems().length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Details.routeName,
                          arguments: {
                            'id': TravelData.getNearestItems()[index].id
                          },
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  TravelData.getNearestItems()[index]
                                      .imageUrl[0],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 20,
                            right: 20,
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: colorVar.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '${TravelData.getNearestItems()[index].distance} km away',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Discover Places',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: colorVar,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: TravelData.getTravelItems().length,
                  itemBuilder: (context, index) => GestureDetector(
                     onTap: () {
                        Navigator.of(context).pushNamed(
                          Details.routeName,
                          arguments: {
                            'id': TravelData.getTravelItems()[index].id
                          },
                        );
                      },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            TravelData.getTravelItems()[index].imageUrl[0],
                            fit: BoxFit.cover,
                            width: 60),
                      ),
                      title: Text(TravelData.getTravelItems()[index].name),
                      subtitle: Text(TravelData.getTravelItems()[index].location),
                      trailing: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Image.asset('assets/images/star.png', width: 20),
                          Text(TravelData.getTravelItems()[index]
                              .rating
                              .toString())
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
