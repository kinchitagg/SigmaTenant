import 'package:flutter/material.dart';
import 'model/model.dart';
import 'ui/MainCard.dart';
import 'ui/topView.dart';
import 'network/network.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Apartment> apartmentObj;
  int _selectedItem = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apartmentObj = getApartmentobj();
  }

  Future<Apartment> getApartmentobj() => Network().getApartment();
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
    debugPrint('$index');
    setState(() {
      _selectedItem = index;
    });
  }
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ClipPath(clipper: MyClipper(), child: TopView()),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 15),
            child: new Text(
              "Featured",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
            ),
          ),
          Container(
            child: FutureBuilder<Apartment>(
                future: apartmentObj,
                builder: (_, AsyncSnapshot<Apartment> snapshot) {
                  if (snapshot.hasData) {
                    return MainCard(snapshot: snapshot);
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        
        items: [
          BottomNavigationBarItem(
            
            title: new Text("home"),
              icon: Icon(
            Icons.home,
            color: Colors.pinkAccent,
            
          )),
          BottomNavigationBarItem(
            title: new Text("Events"),
              icon: Icon(
            Icons.calendar_today,
            color: Colors.pinkAccent,
          )),
          BottomNavigationBarItem(
            title: new Text("search"),
              icon: Icon(
            Icons.search,
            color: Colors.pinkAccent,
          )),
          BottomNavigationBarItem(
            title: new Text("person"),
              icon: Icon(
            Icons.person,
            color: Colors.pinkAccent,
          )),
        ],
        
        selectedItemColor: Colors.pinkAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
