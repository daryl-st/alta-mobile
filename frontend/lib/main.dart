import 'package:flutter/material.dart';
// import './presentation/screens/auth/login.dart';
// import './presentation/screens/auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Alta Counseling")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // height: 300,
                  // width: 300,
                  color: Colors.cyan,
                  child: Card(
                    // margin: EdgeInsets.all(20),
                    clipBehavior: Clip.hardEdge,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Path to Better Mental Wellness Starts Here",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20, width: double.infinity),
                          Text(
                            "Your Path to Better Mental Wellness Starts Here Your Path to Better Mental Wellness Starts Here Your Path to Better Mental Wellness Starts Here Your Path to Better Mental Wellness Starts Here Your Path to Better Mental Wellness Starts Here",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 30, width: double.infinity),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  fixedSize: Size(180, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text("Book Appointment"),
                              ),
                              SizedBox(width: 12, height: 0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  fixedSize: Size(180, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text("Explore Services"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 300,
                  // width: 300,
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UPCOMING",
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "hkjshfdkahd faksdhf kjshdfk hldsajhf kdsahfkjsa dfjhdlafhkdsj hfkjdsh fkhds kflja hdsf kdsfs",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'lucy.png',
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Conference Dinner.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "May 12-14, 2025. Office",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    "haskdhfkjshfdkahs fhskdfhas fhkdsah fklhdsakfh dsafkjhdsakfhals dk",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'lucy.png',
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Conference Dinner.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Jun 12-14, 2025. Office",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Text(
                                    "haskdhfkjshfdkahs fhskdfhas fhkdsah fklhdsakfh dsafkjhdsakfhals dk",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  // width: 300,
                  color: Colors.yellow,
                  child: Text("Area 3"),
                ),
                Container(
                  // height: 300,
                  // width: 300,
                  color: Colors.purple,
                  child: Column(
                    children: [
                      Text(
                        "FAQ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "kjsahd kjhsadflkhdhf kajshdfsk ldahf ksjdfhka lfhkjds hfakfhkdsajhf kd lksajdhfkjashdf kldsahfkj hkdsajfh khfd aksdhfkjahs dhsa lkdjhf sadhfk dshkfhkhdsfkhsadfh sadf ksdhf kas hdfkhdsakf kjsad hf",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[700],
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('lucy.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("Collapsable Window"),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  // width: 300,
                  color: Colors.blue,
                  child: Text("Area 5"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
