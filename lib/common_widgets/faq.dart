import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newitempage/common_widgets/appbar.dart';
import 'package:newitempage/common_widgets/drawer.dart';

class Faqs extends StatelessWidget {
  int _selectedPage = 0;
  var _appBarColor = Colors.green.shade500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context),
      drawer: CommonDrawer(context),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Why Shop with eShop?',
    <Entry>[
      Entry(
          'eShop brings choice, clarity, and convenience to your entire eShop plan shopping experience.'),
    ],
  ),
  Entry(
    'How Do I Report Fraud?',
    <Entry>[
      Entry(
          'You can contact us on the given email or phone numbers 24x7.'),
    ],
  ),
  Entry(
    'What are the payment options available?',
    <Entry>[
      Entry(
          'Currently we only support Cash on Delivery(COD). Our team is working hard to implement Credit/Debit cards, NetBanking, UPI and other online payment options.'),
    ],
  ),

];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}