import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState Function Ran');
  }

  @override
  Widget build(BuildContext context) {
    print('Build Function Ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location '),
        centerTitle: true,
        elevation: 0,
      ),

      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter+=1;
          });
        },
        child: Text('Counter is : $counter'),
      )

    );
  }
}
