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
        drawer: BuildDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(),
                Upcoming(),
                ImageSlider(),
                FAQ(),
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

class Hero extends StatelessWidget {
  const Hero({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.all(8.0),
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UPCOMING",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "hkjshfdkahd faksdhf kjshdfk hldsajhf kdsahfkjsa dfjhdlafhkdsj hfkjdsh fkhds kflja hdsf kdsfs hkjshfdkahd faksdhf kjshdfk hldsajhf kdsahfkjsa dfjhdlafhkdsj hfkjdsh fkhds kflja hdsf kdsfs",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'lucy.png',
                      height: 150,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 240,
                      child: Column(
                        children: [
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
                            "haskdhfkjshfdkahs fhskdfhas fhkdsah fhskdfhas fhkdsah fklhdsakfh dsafkjhdsakfhals dk",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Card(
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Column(
                        children: [
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
                            "haskdhfkjshfdkahs fhskdfhas fhkdsah fklhdsakfh dsafkjhdsakfhals dk haskdhfkjshfdkahs fhskdfhas fhkdsah fklhdsakfh dsafkjhdsakfhals dk",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'lucy.png',
                      height: 150,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Frequntly Asked Questions",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Text(
              "kjsahd kjhsadflkhdhf kajshdfsk ldahf ksjdfhka lfhkjds kd hkdsajfh khfd aksdhfkjahs dhsa sdhkjsd slkdhf lkdjhf dshkfhkhdsfkhsadfh kas hdfkhdsakf kjsad hf",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage('lucy.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Collapsable Window"),
        ],
      ),
    );
  }
}

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // HEADER
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green[900]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 30, child: Icon(Icons.person, size: 40)),
                SizedBox(height: 10),
                Text('John Doe', style: TextStyle(color: Colors.white)),
                Text(
                  'john@email.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),

          // MENU ITEMS
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Navigate to home
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Services'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Blog'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_emergency),
            title: Text('Contact'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Logout logic
            },
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/lucy.png',
    'assets/lucy.png',
    'assets/lucy.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('(OUR SERVICES)', style: TextStyle(fontWeight: FontWeight.w200)),
          Text(
            "Let's All Fight Mental Illness",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              // SLIDES
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),

              // DOTS INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
