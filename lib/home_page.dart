import 'package:flutter/material.dart';
import 'upload_items.dart';
import 'package:ar_furniture_app/item_ui_design_widget.dart';
import 'package:ar_furniture_app/items.dart';
import 'package:ar_furniture_app/upload_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "AR FURNITURE APP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()
                {
                  Navigator.push(context,   MaterialPageRoute(builder: (c) => ItemsUploadScreen()));
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )
          )
        ],
      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("items")
            .orderBy("publishedDate", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot dataSnapshot)
        {
          if(dataSnapshot.hasData)
            {
                return ListView.builder(
                  itemCount: dataSnapshot.data!.docs.length,
                  itemBuilder: (context, index)
                  {
                    Items eachItemInfo= Items.fromJson(
                      dataSnapshot.data!.docs[index].data() as Map<String, dynamic>
                    );

                    return ItemUIDesignWidget(
                      itemsInfo: eachItemInfo,
                      context: context,
                    );
                  },
                );
            }
          else
            {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child:Text(
                      "Data is not available",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            }
        },
      ),
    );
  }
}
