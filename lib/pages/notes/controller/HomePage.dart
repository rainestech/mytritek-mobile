import 'package:flutter/material.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/entity/note.dart';

import 'NotePage.dart';
import 'StagerredView.dart';

enum viewType { List, Staggered }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notesViewType;

  @override
  void initState() {
    super.initState();
    notesViewType = viewType.Staggered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeGold, //change your color here
        ),
        brightness: Brightness.light,
        actions: _appBarActions(),
        elevation: 1,
        backgroundColor: themeBlue,
        centerTitle: true,
        title: Text(
          "My Notes",
          style: TextStyle(
              color: themeGold
          ),
        ),
      ),
      body: SafeArea(
        child: _body(),
        right: true,
        left: true,
        top: true,
        bottom: true,
      ),
      // bottomSheet: _bottomBar(),
    );
  }

  Widget _body() {
    return Container(
        child: StaggeredGridPage(
      notesViewType: notesViewType,
    ));
  }

  //Contains a FlatButton widget that is responsible for calling the _newNoteTapped function to take us to
  //a new page to create a new note
  Widget _bottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text(
            "New Note\n",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _newNoteTapped(context),
        )
      ],
    );
  }

/* responsible for creating a new route using the Navigator.push class*/
  void _newNoteTapped(BuildContext ctx) {
    // "-1" id indicates the note is not new
    var emptyNote = new Notes();
    Navigator.push(
        ctx, MaterialPageRoute(builder: (ctx) => NotePage(emptyNote)));
  }

  //sets the viewType to either grid or list based on the noteViewType value
  void _toggleViewType() {
    setState(() {
      if (notesViewType == viewType.List) {
        notesViewType = viewType.Staggered;
      } else {
        notesViewType = viewType.List;
      }
    });
  }

  List<Widget> _appBarActions() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: InkWell(
          child: GestureDetector(
            onTap: () => _toggleViewType(),
            child: Icon(
              notesViewType == viewType.List
                  ? Icons.developer_board
                  : Icons.view_headline,
              color: themeGold,
            ),
          ),
        ),
      ),
    ];
  }
}
