import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String searchQuery = '';

  List<Map<String, dynamic>> items = [
    {
      'id': 'E471',
      'description': 'lerem nsnf jnjfsd\n jbnjwebf jswnfid bvvui ',
    },
    {
      'id': 'a472',
      'description': 'erem nsnf jnjfsd\n jbnjwebf jswnfid\n bvvui huyu',
    },
    {
      'id': 'B473',
      'description': 'lerem nsnf jnjfsd jbnjwebf jswnfid\n bvvui huyu',
    },
     {
      'id': 'b474',
      'description': 'lerem nsnf jnjfsd jbnjwebf jswnfid\n bvvui huyu',
    },
     {
      'id': 'c475',
      'description': 'lerem nsnf jnjfsd jbnjwebf jswnfid\n bvvui huyu',
    },
    // Add more items as needed
  ];

  List<Map<String, dynamic>> get filteredItems {
    return items
        .where((item) =>
            item['id'].toLowerCase().contains(searchQuery.toLowerCase()) ||
            item['description']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.g_translate_sharp,
                color: Color.fromARGB(255, 0, 166, 255)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'Drawer',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Item 1',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),

      //*********************body******************************* */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: TextFormField(
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Search...",
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),

            //******************************all boxes************************** */
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 7, 255, 243),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    var item = filteredItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.09, // Adjusted to 90% of screen width
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 72, 255),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:15.0,top: 15),
                                    child: Text(
                                      item['id'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      item['description'],
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.keyboard_arrow_right, size: 60),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
