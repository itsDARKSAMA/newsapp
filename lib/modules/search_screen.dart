import 'package:flutter/material.dart';
import 'package:newsapp/shared/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DefaultFormField(
                textLabel: "Search",
                // fieldContorller: ,
                prefixIcon: Icons.search,
                keyboardType: TextInputType.text),
          ),
        ],
      ),
    );
  }
}
