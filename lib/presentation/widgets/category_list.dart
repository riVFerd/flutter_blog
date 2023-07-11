import 'package:flutter/material.dart';
import 'package:flutter_blog/logic/models/category_model.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
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
                      title: Text(widget.categories[index].categoryName),
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
