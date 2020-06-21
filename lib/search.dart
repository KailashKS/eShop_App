import 'package:flutter/material.dart';
import 'package:newitempage/common_widgets/constants.dart';
import 'package:newitempage/common_widgets/items.dart';
import 'lists.dart' as shop;

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
          showSearch(context: context, delegate: DataSearch(),);
          //return Contain(list: cities,length: cities.length,wid: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),));
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList =  shop.items.where((text) => text.toLowerCase().startsWith(query.toLowerCase())).toList();
    return Contain(list: suggestionList,length: suggestionList.length,wid: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),),draw: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),));
//    return Text(
//      "Hello World", style: TextStyle(fontSize: 36.0,color: Colors.black),
//    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =  query.isEmpty ? shop.items : shop.items.where((text) => text.toLowerCase().startsWith(query.toLowerCase())).toList();
    return Contain(list: suggestionList,length: suggestionList.length,wid: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),),draw: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),),);
    //return Contain(suggestionList: suggestionList,);
//    return ListView.builder(
//      itemBuilder: (context, index) => ListTile(
//        leading: Icon(MdiIcons.pill),
//        title: RichText(
//          text: TextSpan(
//              text: suggestionList[index].substring(0, query.length),
//              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//              children: [
//                TextSpan(
//                    text: suggestionList[index].substring(query.length),
//                    style: TextStyle(color: Colors.grey)
//                )
//              ]
//          ),
//        ),
//      ),
//      itemCount: suggestionList.length,
//    );
  }
}
