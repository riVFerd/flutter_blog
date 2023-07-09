import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.categories});
  final List<String> categories;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() => _isExpanded = !_isExpanded);
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          headerBuilder: (context, isExpanded) {
            return const ListTile(
              title: Text('Categories'),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.categories[index]),
                    );
                  },
                ),
              ],
            ),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}