import 'package:flutter/material.dart';
import 'package:task1/model/model.dart';

class MainCard extends StatefulWidget {
  final AsyncSnapshot<Apartment> snapshot;

  const MainCard({Key key, this.snapshot}) : super(key: key);
  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  List<String> selectedTag = [];
  changeTag() {
    setState(() {});
  }
int tagnum = 0;
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Apartment> snapshot = widget.snapshot;

    
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (selectedTag.isNotEmpty) Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                    
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 3.0,
                      children: <Widget>[
                        for (var item in selectedTag)
                          RaisedButton(
                            child: Text(item.toString(),
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold)),
                            textColor: Colors.pinkAccent,
                            color: Colors.white,
                            onPressed: () {
                              selectedTag.removeAt(tagnum);
                              setState(() {});
                            },
                          ),
                      ],
                    ),
                  ),
          ) else Text(''),
          Container(
            height: 430,
            child: ListView.builder(
                itemCount: snapshot.data.json.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 20, right: 20, bottom: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: DataCard(
                            snapshot, index, context, selectedTag, tagnum,
                            notifyParent: changeTag),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}

class DataCard extends StatefulWidget {
  final Function() notifyParent;
  final AsyncSnapshot<Apartment> snapshot;
  final int index;
  final BuildContext context;
  final List<String> selectedTag;
  final int tagnum;

  DataCard(
      this.snapshot, this.index, this.context, this.selectedTag, this.tagnum,
      {Key key, @required this.notifyParent})
      : super(key: key);

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  List<String> secondary = [
    'Photoshoot',
    'Parties',
    'Webinars',
    'Virtual Classes',
    'Meeting room'
  ];
  List<String> image = [
    "asset/house1.jpg",
    "asset/house2.jpg",
    "asset/house3.jpeg",
    "asset/house4.jpg",
    "asset/house5.jpg",
    "asset/house6.jpeg",
    "asset/house7.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    var apartment = widget.snapshot.data.json;
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
                          '${image[widget.index]}',
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
                    "${apartment[widget.index].buildingName}",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 8),
                    Icon(Icons.location_on),
                    new Text.rich(TextSpan(
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(text: apartment[widget.index].streetDetails),
                          TextSpan(
                            text: '...',
                          ),
                        ])),
                    SizedBox(width: 10),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 3.0,
                          children: <Widget>[
                            for (var item in secondary)
                              RaisedButton(
                                elevation: 3.0,
                                child: Text(item,
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                color: Colors.white,
                                onPressed: () {
                                  //Provider.of<Space>(context, listen: false).addTags(item,index);
                                  if (widget.selectedTag.contains(item))
                                    print("tag already selected");
                                  else {
                                    print('selecting a tag');
                                    widget.selectedTag
                                        .insert(widget.tagnum, item);
                                    widget.notifyParent();
                                  }

                                  print(widget.selectedTag.length);
                                  for (var item in widget.selectedTag)
                                    print(item);
                                },
                              ),
                          ],
                        )))
              ],
            )));
  }
}

// Widget dataCard(

//       AsyncSnapshot<Apartment> snapshot, int index, BuildContext context) {

//     return ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         child: Card(
//             elevation: 4,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // child: Padding(
//                 //   padding: const EdgeInsets.only(top:5.0,right: 5,left: 5,bottom: 30),

//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Container(
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         child: Image.asset(
//                           '${image[index]}',
//                           height: 210,
//                           width: MediaQuery.of(context).size.width,
//                           fit: BoxFit.fill,
//                         )),
//                   ),
//                   //),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: new Text(
//                     "${apartment[index].buildingName}",
//                     style: TextStyle(fontSize: 21),
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(width:8),
//                     Icon(Icons.location_on),

//                     new Text.rich(TextSpan(
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
//             children: <TextSpan>[
//               TextSpan(text: apartment[index].streetDetails),
//               TextSpan(
//                   text: '...',
//               ),
//             ])),
//             SizedBox(width: 10),

//                   ],
//                 )
//               ],
//             )));
//   }
