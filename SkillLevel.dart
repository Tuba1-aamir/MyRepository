import 'package:flutter/material.dart';

void main() => runApp(SkillLevel());

class SkillLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RadioWidgetDemo(),

    );
  }
}

class RadioWidgetDemo extends StatefulWidget {
  RadioWidgetDemo() : super();

  @override
  RadioWidgetDemoState createState() => RadioWidgetDemoState();
}

class RadioWidgetDemoState extends State<RadioWidgetDemo> {
  //
  List<User> users;
  User selectedUser;
  int selectedRadio;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    users = User.getUsers();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedUser(User user) {
    setState(() {
      selectedUser = user;
    });
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (User user in users) {
      widgets.add(
        RadioListTile(
          value: user,
          groupValue: selectedUser,
          title: Text(user.firstName),
          subtitle: Text(user.lastName),
          onChanged: (currentUser) {
            print("Current User ${currentUser.firstName}");
            setSelectedUser(currentUser);
          },
          selected: selectedUser == user,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),

          ),
          Column(
            children: createRadioListUsers(),
          ),
          Divider(
            height: 40,
            color: Colors.green,
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: Colors.green,
                onChanged: (val) {
                  print("Radio $val");
                  setSelectedRadio(val);
                },
              ),
              Radio(
                value: 2,
                groupValue: selectedRadio,
                activeColor: Colors.blue,
                onChanged: (val) {
                  print("Radio $val");
                  setSelectedRadio(val);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class User {
  int userId;
  String firstName;
  String lastName;

  User({this.userId, this.firstName, this.lastName});

  static List<User> getUsers() {
    return <User>[
      User(userId: 1, firstName: "Entry Level" , lastName: "I am relatively new to this field"),
      User(userId: 2, firstName: "Intermediate", lastName: "I have substantial experience in this field"),
      User(userId: 3, firstName: "Expert", lastName: "I have comprehensive and deep Expertise in this filed"),

    ];
  }
}

