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
    'Why Shop with Socure?',
    <Entry>[
      Entry(
          'Socure brings choice, clarity, and convenience to your entire Socure plan shopping experience.'),
    ],
  ),
  Entry(
    'How Do I Report Disability Fraud?',
    <Entry>[
      Entry(
          'If you suspect any sort of disability fraud, you can report it to the Social Security Administration (SSA) via Internet, phone, or mail. According to the Centers for Medicare & Medicaid Services, fraud is any act of intentional deception in order to receive an unlawful benefit. Examples of disability fraud may include making false statements on claims or concealing employment in order to continue receiving disability benefits.'),
    ],
  ),
  Entry(
    'Do we have subscription program',
    <Entry>[
      Entry(
          'Yes, we do! We want to offer this monthly renewal service so that everyone in the family can maximize the benefits we offer. Apart from Subscription we also provide One Time To know more about our subscription programme, feel free to contact'),
    ],
  ),
  Entry(
    'Are my credit/debit card details are secure?',
    <Entry>[
      Entry(
          'Absolutely! Your card details will NOT be stored anywhere. Your card information goes through a completely secured and approved payment gateway for processing.'),
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