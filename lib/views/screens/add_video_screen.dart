import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  _showOptionDialog(BuildContext context) {
    return showDialog(
      // you have to return the widget to show  each element..
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.camera),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.cancel),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showOptionDialog(context);
      },
      child: Container(
        height: 50,
        width: 190,
        decoration: BoxDecoration(

          
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Center(
          child: Text(
            "Add Video",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
