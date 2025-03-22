import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

class SchedulePickupScreen extends StatefulWidget {
  @override
  _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  bool repeatWeekly = false;
  String dropdownValue = '1 Week';
  final List<String> garbageTypes = [
    'Plastic Garbage',
    'Metal Garbage',
    'Glass Garbage',
    'Paper Garbage',
  ];
  List<bool> garbageChecked = [false, false, false, false];

  List<double> garbageWeights = [2.6, 1.4, 5.4, 0.8];

  int selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 214, 214),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 106, 34),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index; // Update the selected index
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 80,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          selectedDateIndex == index
                              ? Colors.blue[200]
                              : Colors.white, // Highlight selected date
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                selectedDateIndex == index
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ['16', '17', '18', '19', '20', '21'][index],
                          style: TextStyle(
                            color:
                                selectedDateIndex == index
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: repeatWeekly,
                  onChanged: (bool? value) {
                    setState(() {
                      repeatWeekly = value!;
                    });
                  },
                ),
                Text(
                  'Repeat Weekly',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items:
                      <String>[
                        '1 Week',
                        '2 Weeks',
                        '3 Weeks',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Garbage',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: List.generate(garbageTypes.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ), // Add left margin
                            child: Row(
                              children: [
                                Checkbox(
                                  value: garbageChecked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      garbageChecked[index] = value!;
                                    });
                                  },
                                ),
                                Icon(
                                  Icons.recycling,
                                  color: const Color.fromARGB(255, 28, 106, 34),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  garbageTypes[index],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ), // Add right margin
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (garbageWeights[index] > 0.1) {
                                        garbageWeights[index] -= 0.1;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '${garbageWeights[index].toStringAsFixed(1)} Kg',
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      garbageWeights[index] += 0.1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PICK UP ADDRESS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue),
                      Text(
                        'Edit Address',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: const Color.fromARGB(255, 28, 106, 34),
                ),
                title: Text(
                  'HOME',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 28, 106, 34), // Green color
                  ),
                ),

                subtitle: Text(
                  'GVVM+V26, St. 114, Phnom Penh\nGVVM+V26, St. 114, Phnom Penh',
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 28, 106, 34),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white, size: 25),
                  SizedBox(width: 8),
                  Text(
                    'New Pickup',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
