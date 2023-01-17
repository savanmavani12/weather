import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/Global/Global.dart';
import 'package:weather/Helper/Helper.dart';
import 'package:weather/Model/Model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentDate = DateTime.now();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                controller: cityController,
                prefixInsets: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(24),
                padding: const EdgeInsets.symmetric(vertical: 10),
                placeholder: "Search city name",
                placeholderStyle: TextStyle(
                  fontSize: 12,
                  color: Global.bg1Color.withOpacity(0.6),
                ),
                onSubmitted: (val) {
                  // String city = cityController.text;
                  setState(() {
                    Global.search = val;
                    //ApiHelpers.apiHelpers.getData(city: city, code: Global.country);
                    cityController.clear();
                  });
                },
                backgroundColor: Colors.white,
              ),

            ),
          ),
          PopupMenuButton(
            onSelected: (val) {
              setState(() {
                Global.country = val;
                Global.searchData();
              });
            },
            color:Colors.white,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "In",
                child: Text("India"),
              ),
              const PopupMenuItem(
                value: "UK",
                child: Text("United Kingdom"),
              ),
              const PopupMenuItem(
                value: "IT",
                child: Text("Italy"),
              ),
              const PopupMenuItem(
                value: "RU",
                child: Text("Russia"),
              ),
              const PopupMenuItem(
                value: "FR",
                child: Text("France"),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiHelpers.apiHelpers
            .getData(city: Global.search, code: Global.country),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error is : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Weather? data = snapshot.data;
            return (data != null)
                ? Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(Global.gif),
                          fit: BoxFit.fitHeight),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data.name}, ${Global.title}",
                            style: Style3,
                          ),
                          Text(
                            "Today,${Global.months[currentDate.month - 1]} ${currentDate.day} ${currentDate.hour}:${currentDate.minute}",style: Style3,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.sun_max,
                                      color: Global.color1,
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        data.description,
                                        style: Style3,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${(data.feelsLike.toInt() - 273.15).toInt()}°",
                                  style: TextStyle(
                                    color: Global.color1,
                                    fontSize: 86,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Weather",
                              style: TextStyle(
                                color: Global.bg1Color,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Global.bg1Color,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage: const AssetImage(
                                                "assets/icons/heating.png"),
                                            backgroundColor:
                                            Global.bg2Color,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Text(
                                              "Feel like",
                                              style: Style,
                                            ),
                                            Text(
                                              "${(data.feelsLike.toInt() - 273.15).toInt()}°",
                                              style: Style1,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage:
                                            const AssetImage(
                                                "assets/icons/wind.png"),
                                            backgroundColor:
                                            Global.bg2Color,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Text(
                                              "Wind",
                                              style: Style,
                                            ),
                                            Text(
                                              "${data.speed.toInt()} km/h",
                                              style: Style1,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage: const AssetImage(
                                                "assets/icons/raining.png"),
                                            backgroundColor:
                                            Global.bg2Color,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Text(
                                              "Pressure",
                                              style: Style,
                                            ),
                                            Text(
                                              "${data.pressure} hpa",
                                              style: Style1,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage: const AssetImage(
                                                "assets/icons/humidity.png"),
                                            backgroundColor:
                                            Global.bg2Color,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Text(
                                              "Humidity",
                                              style: Style,
                                            ),
                                            Text(
                                              "${data.humidity.toInt()}%",
                                              style: Style1,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
                : const Center(
              child: Text("Data is Not Founds ...."),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  TextStyle Style = TextStyle(
    color: Global.bg1Color,
    fontSize: 14,
  );
  TextStyle Style1 = TextStyle(
    color: Global.bg3Color,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  TextStyle Style2 = const TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );
  TextStyle Style3 = TextStyle(
    color: Global.bg1Color,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}
