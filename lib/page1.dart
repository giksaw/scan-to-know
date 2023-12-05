import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "E471";

  final List<String> categories = [
    "Description",
    "Source of Ingredients",
    "Uses in food",
    "Harmful Effects",
    "Allergies"
  ];

  final List<String> itemName = [
    "E471",
    "Refined Flour",
    "Maida",
  ];

  final List<String> itemCommonName = [
    "E471",
    "Refined Flour",
    "Maida",
  ];

  final List<String> itemDescription = [
    "E471",
    "Refined Flour",
    "Maida",
  ];

  final List<String> itemIngredient = [
    "E471",
    "Refined Flour",
    "Maida",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//  appbar
//
//
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(),
          )
        ],
      ),

      body: SingleChildScrollView(
    
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 16),
          child: Column(
            children: [
              Row(
                children: [

                      //searchbar
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "search here",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromRGBO(0, 255, 64, 1))),
                    ),
                  )),
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 20, right: 8, bottom: 8),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  )
                ],
              ),

              //main box light blue

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 174,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 224, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                            "E471 is a food additive that is commonly known as mono- and diglycerides of fatty acids Read more...",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                      )
                    ],
                  ),
                ),
              ),

              // scrollbar

              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext contex, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getContainerColor(index),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color:  const Color.fromRGBO(0, 47, 167, 1))
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: getTxtColor(index),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              /* spacer*/
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(0, 47, 167, 1),
                ),
              ),

              //content details conatiner
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "it is a finely milled white flour with the bran and germ removed.   ",
                      style: TextStyle(color: Color.fromRGBO(0, 47, 167, 1)),
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

  int selectedIndex = 0;
  int textindex = 0;
  getContainerColor(int index) {
    return selectedIndex == index
        ? const Color.fromRGBO(0, 47, 167, 1)
        : Colors.white;
  }

  getTxtColor(int index) {
    return selectedIndex == index
        ? Colors.white
        : const Color.fromRGBO(0, 47, 167, 1);
  }

  String getItemByName(String name) {

    String lowerCaseName = name.toLowerCase();

    for (String item in itemName) {
      if (item.toLowerCase() == lowerCaseName) {
        return item;
      }
    }

    return "nullvalue";
  }
}

//  return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: getContainerColor(index),
//                           borderRadius: BorderRadius.circular(20)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(categories[index]

//                           ),
//                         ),
//                       ),
//                     );

// class MyContainerList extends StatefulWidget {
//   @override
//   _MyContainerListState createState() => _MyContainerListState();
// }

// class _MyContainerListState extends State<MyContainerList> {
//   int selectedIndex = 0; // Initially selecting the first container

//   Color getContainerColor(int index) {

//   }
