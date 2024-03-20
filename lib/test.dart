import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage1 extends StatefulWidget {
  const SearchPage1({Key? key}) : super(key: key);

  @override
  State<SearchPage1> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage1> {
  String name = "Name";
  List<dynamic> desc = ["Description"];
  List<dynamic> commonNameEng = ["common name"]; // Changed to empty string
  List<dynamic> displaytext = [""];
  List<dynamic> allergy = ["Allergy"];
  List<dynamic> harmfuleffect = ["Harmful Effects"];
  List<dynamic> commonuse = ["Common Use"];
  List<dynamic> soi = ["Source of ingredient"];
  String jobiins = "";
  int lang = 0;

  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    "Description",
    "Source of Ingredients",
    "Uses in food",
    "Harmful Effects",
    "Allergies"
  ];
  final List<String> malCategories = [
    "വിവരണം",
    "ചേരുവകളുടെ ഉറവിടം",
    "ഭക്ഷണത്തിൽ ഉപയോഗിക്കുന്നു",
    "ഹാനികരമായ ഫലങ്ങൾ",
    "അലർജികൾ"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "Know your Food",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.language), // Add your desired icon for the button
            onPressed: () {
              // Add your onPressed function here to toggle the language
              if (lang == 1) {
                lang = 0;
              } else {
                lang = 1;
              }
              getdata(lang);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: "Search here",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 20, right: 8, bottom: 8),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        getdata(lang);
                      },
                    ),
                  )
                ],
              ),

              // Main box
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 174,
                    ), // Minimum height set to the previous fixed height
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(164, 225, 245, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            name, // Display received name
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var item in commonNameEng)
                                Text(
                                  item,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
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

              // Scrollbar
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
                          //print(selectedIndex);
                          getText(selectedIndex);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: getContainerColor(index),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color.fromRGBO(13, 8, 66, 1))),
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

              /* Spacer*/
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromRGBO(13, 8, 66, 1),
                ),
              ),

              // Content details container
          Padding(
  padding: const EdgeInsets.all(8.0),
  child: ListView.builder(
    shrinkWrap: true,
    itemCount: displaytext.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          displaytext[index],
          style: const TextStyle(
            color: Color.fromRGBO(13, 8, 66, 1),
          ),
        ),
      );
    },
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
        ? const Color.fromRGBO(13, 8, 66, 1)
        : Colors.white;
  }

  getTxtColor(int index) {
    return selectedIndex == index
        ? Colors.white
        : const Color.fromRGBO(13, 8, 66, 1);
  }

  getText(int index) {
    //print("hi");
    //print(desc);
    //print(commonNameEng);
    if (index == 0) {
      displaytext = desc;
    } else if (index == 1) {
      displaytext = soi;
    } else if (index == 2) {
      displaytext = commonuse;
    } else if (index == 3) {
      displaytext = harmfuleffect;
    } else if (index == 4) {
      displaytext = allergy;
    }

    // Return empty string as default
  }

  void _showItemNotFoundDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Item Not Found"),
          content: const Text("No common name found for the given query."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Function to trigger the search action
// Function to trigger the search action
  void searchCommonName(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/commonnames/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        setState(() {
          name = responseData['data'][0]
              as String; // Assuming 'data' contains 'commonnames_eng'
        });
      } else {
        _showItemNotFoundDialog(); // Call the dialog method
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      _showItemNotFoundDialog(); // Call the dialog method
    } else {
      // Handle other errors
      _showItemNotFoundDialog(); // Call the dialog method
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch descriptions
  void fetchDescription(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/description/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        desc = responseData['data'] as List<dynamic>;

        //print(desc);
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);

        setState(() {
          getText(0);
        });
        // Assuming 'data' contains description
        // Update the UI to display the fetched description
        // For example, you can assign the description to a variable and use it in the UI
        // description = responseData['data'][0] as String;
      } else {
        //print('No description found for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No description found for $query');
    } else {
      // Handle other errors
      //print('Failed to fetch description: ${response.statusCode}');
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch common names in Malayan
  void fetchCommonNamesEng(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/commonnames/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        commonNameEng = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No common names found in Malayan for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No common names found in Malayan for $query');
    } else {
      // Handle other errors
      //print('Failed to fetch common names in Malayan: ${response.statusCode}');
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch common names
  void fetchCommonUse(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/commonuse/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        commonuse = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No common use content found for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No common use content found for $query');
    } else {
      // Handle other errors
      //print('Failed to fetch common use content: ${response.statusCode}');
    }
  }

// Inside the _SearchPageState class, add a new function to fetch harmful effects in English
  void fetchHarmfulEffectsEng(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/harmfuleffects/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        harmfuleffect = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No harmful effects found in English for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No harmful effects found in English for $query');
    } else {
      // Handle other errors
      print(
          'Failed to fetch harmful effects in English: ${response.statusCode}');
    }
  }

// Inside the _SearchPageState class, add a new function to fetch allergy information in English
  void fetchAllergyEng(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/allergy/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        allergy = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No allergy information found in English for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No allergy information found in English for $query');
    } else {
      // Handle other errors
      print(
          'Failed to fetch allergy information in English: ${response.statusCode}');
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch source of ingredients information in English
  // Inside the _SearchPageState class, add a new function to fetch source of ingredients information in English
  void fetchSourceOfIngredientsEng(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/sourceofingredients/eng'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        soi = responseData['data'] as List<dynamic>;
        // jobiins = responseData['data'];
        // //print(jobiins);
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        print(
            'No source of ingredients information found in English for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No source of ingredients information found in English for $query');
    } else {
      // Handle other errors
      print(
          'Failed to fetch source of ingredients information in English: ${response.statusCode}');
    }
  }

  // void searchCommonName(String query) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:4050/ingredient/commonnames/eng'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'names': [query]
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     //print(responseData); // //print response data for debugging
  //     if (responseData['data'] != null && responseData['data'].isNotEmpty) {
  //       setState(() {
  //         name = responseData['data'][0]
  //             as String; // Assuming 'data' contains 'commonnames_eng'
  //       });
  //     } else {
  //       //print('No common name found for $query');
  //     }
  //   } else if (response.statusCode == 404) {
  //     // Handle 404 error
  //     //print('No common name found for $query');
  //   } else {
  //     // Handle other errors
  //     //print('Failed to search common name: ${response.statusCode}');
  //   }
  // }

  // Inside the _SearchPageState class, add a new function to fetch descriptions
  void fetchDescriptionMal(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/description/mal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        desc = responseData['data'] as List<dynamic>;

        //print(desc);
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);

        setState(() {
          getText(0);
        });
        // Assuming 'data' contains description
        // Update the UI to display the fetched description
        // For example, you can assign the description to a variable and use it in the UI
        // description = responseData['data'][0] as String;
      } else {
        //print('No description found for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No description found for $query');
    } else {
      // Handle other errors
      //print('Failed to fetch description: ${response.statusCode}');
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch common names in Malayan
  void fetchCommonNamesMal(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/commonnames/mal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        commonNameEng = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No common names found in Malayan for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No common names found in Malayan for $query');
    } else {
      // Handle other errors
      //print('Failed to fetch common names in Malayan: ${response.statusCode}');
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch common names
  void fetchCommonUseMal(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/commonuse/mal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        commonuse = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No common use content found for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No common use content found for $query');
    } else {
      // Handle other errors
      //print('Failed to fetch common use content: ${response.statusCode}');
    }
  }

// Inside the _SearchPageState class, add a new function to fetch harmful effects in English
  void fetchHarmfulEffectsMal(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/harmfuleffects/mal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        harmfuleffect = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No harmful effects found in English for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No harmful effects found in English for $query');
    } else {
      // Handle other errors
      print(
          'Failed to fetch harmful effects in English: ${response.statusCode}');
    }
  }

// Inside the _SearchPageState class, add a new function to fetch allergy information in English
  void fetchAllergyMal(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/allergy/mal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        allergy = responseData['data'] as List<dynamic>;
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        //print('No allergy information found in English for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No allergy information found in English for $query');
    } else {
      // Handle other errors
      print(
          'Failed to fetch allergy information in English: ${response.statusCode}');
    }
  }

  // Inside the _SearchPageState class, add a new function to fetch source of ingredients information in English
  // Inside the _SearchPageState class, add a new function to fetch source of ingredients information in English
  void fetchSourceOfIngredientsMal(String query) async {
    final response = await http.post(
      Uri.parse('http://localhost:4050/ingredient/sourceofingredients/mal'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'names': [query]
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      //print(responseData); // //print response data for debugging
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        soi = responseData['data'] as List<dynamic>;
        // jobiins = responseData['data'];
        // //print(jobiins);
        // Assuming 'data' contains common names in Malayan
        // Update the UI to display the fetched common names
        // For example, you can assign the common names to a variable and use it in the UI
        // commonNamesMal = List<String>.from(responseData['data']);
      } else {
        print(
            'No source of ingredients information found in English for $query');
      }
    } else if (response.statusCode == 404) {
      // Handle 404 error
      //print('No source of ingredients information found in English for $query');
    } else {
      // Handle other errors
      print(
          'Failed to fetch source of ingredients information in English: ${response.statusCode}');
    }
  }

  void getdata(int lang) {
    if (lang == 0) {
      // Trigger search action
      searchCommonName(_searchController.text.toLowerCase());
      fetchDescription(_searchController.text.toLowerCase());
      setState(() {
        selectedIndex = 0;
        getTxtColor(0);
        getText(0);
      });
      fetchCommonNamesEng(_searchController.text.toLowerCase());
      fetchCommonUse(_searchController.text.toLowerCase());
      fetchHarmfulEffectsEng(_searchController.text.toLowerCase());
      fetchSourceOfIngredientsEng(_searchController.text.toLowerCase());
      fetchAllergyEng(_searchController.text.toLowerCase());
    } else {
      searchCommonName(_searchController.text.toLowerCase());
      fetchDescriptionMal(_searchController.text.toLowerCase());
      setState(() {
        selectedIndex = 0;
        getTxtColor(0);
        getText(0);
      });
      fetchCommonNamesMal(_searchController.text.toLowerCase());
      fetchCommonUseMal(_searchController.text.toLowerCase());
      fetchHarmfulEffectsMal(_searchController.text.toLowerCase());
      fetchSourceOfIngredientsMal(_searchController.text.toLowerCase());
      fetchAllergyMal(_searchController.text.toLowerCase());
    }
  }
}
