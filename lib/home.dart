import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    //set background
    String bgImage = data['isDaytime']==true ? 'assets/night.jpg' : 'assets/day.jpg';
    Color bgColor = data['isDaytime']==true ? Colors.black : Color.fromARGB(255, 9, 64, 109);
    //String bgImage = data['isDayTime']!=null && data['isDayTime']==true ? 'assets/night.jpg' : 'assets/day.jpg';
    //Color bgColor = data['isDayTime']!=null && data['isDayTime']==true  ? Colors.black : Color.fromARGB(255, 7, 48, 118);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            
              image: DecorationImage(
                
             image: AssetImage('$bgImage'),
            fit: BoxFit.cover,
          )
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: const Text(
                      'Change Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                
                // AnalogClock(
                //   decoration: BoxDecoration(
                //       border: Border.all(width: 2.0, color: Colors.black),
                //       color: Colors.transparent,
                //       shape: BoxShape.circle),
                //   width: 150.0,
                //   isLive: true,
                //   hourHandColor: Colors.black,
                //   minuteHandColor: Colors.black,
                //   showSecondHand: false,
                //   numberColor: Colors.black87,
                //   showNumbers: true,
                //   showAllNumbers: false,
                //   textScaleFactor: 1.4,
                //   showTicks: false,
                //   showDigitalClock: false,
                //   datetime: DateTime(2019, 1, 1, 9, 12, 15),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
