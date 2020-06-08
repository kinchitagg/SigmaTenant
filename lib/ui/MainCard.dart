import 'package:flutter/material.dart';
import 'package:task1/model/model.dart';


class MainCard extends StatelessWidget {
  final AsyncSnapshot<Apartment> snapshot;

  const MainCard({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var apartmentobj = snapshot.data.json;
    return Container(
      height: 430,
      child: ListView.builder(
          
          itemCount: snapshot.data.json.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10.0,left:20,right:20,bottom:30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: dataCard(snapshot, index, context),
                ),
              )),
    );
  }

  Widget dataCard(
      AsyncSnapshot<Apartment> snapshot, int index, BuildContext context) {
    var apartment = snapshot.data.json;
    List<String> image = [
      "asset/house1.jpg",
      "asset/house2.jpg",
      "asset/house3.jpeg",
      "asset/house4.jpg",
      "asset/house5.jpg",
      "asset/house6.jpeg",
      "asset/house7.jpeg",
    ];
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // child: Padding(
                //   padding: const EdgeInsets.only(top:5.0,right: 5,left: 5,bottom: 30),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.asset(
                          '${image[index]}',
                          height: 210,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        )),
                  ),
                  //),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: new Text(
                    "${apartment[index].buildingName}",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width:8),
                    Icon(Icons.location_on),

                    new Text.rich(TextSpan(
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(text: apartment[index].streetDetails),
              TextSpan(
                  text: '...',
              ),
            ])),
            SizedBox(width: 10),
                    
                  ],
                )
              ],
            )));
  }
}
