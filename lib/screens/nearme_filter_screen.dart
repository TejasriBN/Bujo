import 'package:flutter/material.dart';
import 'package:bujo/widgets/multi_chip.dart';

class NFilterScreen extends StatefulWidget {
  //static const routeName = '/emergencyFilter';

  @override
  _NFilterScreenState createState() => _NFilterScreenState();
}

class _NFilterScreenState extends State<NFilterScreen> {
  var labels;
  var startLabel;
  var endLabel;
  double minKm = 1;
  double maxKm = 100;
  late RangeValues values;

  List<String> NearMe = [
    'NGO',
    'Hospital',
    'Vet',
    'Pharmacy',
    'Pet Accessories'
  ];

  List<String> locations = [
    "Chennai",
    "Mumbai",
    "Banglore",
    "Hyderabad",
  ];

  List<String> sortingOptions = [
    "Nearest First",
    "Farthest First",
    "Ratings"
  ];


  @override
  void initState() {
    values = RangeValues(minKm, maxKm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Filters",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromRGBO(12, 63, 102, 1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Distance",
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '1 Km',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '100 Km',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(trackHeight: 2),
              child: RangeSlider(
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Colors.grey,
                divisions: 100,
                min: minKm,
                max: maxKm,
                labels: labels,
                values: values,
                onChanged: (value) {
                  setState(() {
                    values = value;
                    labels =
                        RangeLabels("${value.start} Km", "${value.end} Km");
                    startLabel = "${value.start} Km";
                    endLabel = "${value.end} km";
                  });
                },
              ),
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            Text(
              "Near Me",
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            MultiSelectChip(
              NearMe,
              onSelectionChanged: (List<String> sdfsd) {},
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            Text(
              "Location",
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            MultiSelectChip(
              locations,
              onSelectionChanged: (List<String> sdfsd) {},
            ),
            Divider(),

            SizedBox(
              height: 16,
            ),
            Text(
              "Sort by",
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 16,
            ),
            MultiSelectChip(
              sortingOptions,
              onSelectionChanged: (List<String> sdfsd) {},
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 12,
                ),
                RaisedButton(
                  child: Text(
                    "Clear",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
