import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:friendlyeats_flutter/src/model/filter.dart';
import 'package:friendlyeats_flutter/src/model/values.dart' as hardcoded;

class FilterSelectDialog extends StatefulWidget {
  final Filter? _filter;

  const FilterSelectDialog({Key? key, Filter? filter})
      : _filter = filter,
        super(key: key);

  @override
  _FilterSelectDialogState createState() =>
      _FilterSelectDialogState(filter: _filter);
}

class _FilterSelectDialogState extends State<FilterSelectDialog> {
  String? _category;
  String? _city;
  int? _price;
  String? _sort;

  _FilterSelectDialogState({Filter? filter}) {
    if (filter != null && !filter.isDefault) {
      _category = filter.category;
      _city = filter.city;
      _price = filter.price;
      _sort = filter.sort;
    }
  }

  Widget _buildDropdown<T>(
    List labels,
    List values,
    dynamic selected,
    FilterChangedCallback<T> onChanged,
  ) {
    final items = [
      for (var i = 0; i < values.length; i++)
        DropdownMenuItem<T>(value: values[i], child: Text(labels[i])),
    ];
    return DropdownButton<T>(
      items: items,
      isExpanded: true,
      value: selected,
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownRow<T>({
    required List<T?> values,
    required List<String> labels,
    required T? selected,
    required IconData icon,
    required FilterChangedCallback<T> onChanged,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(icon),
        Expanded(
            child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
          child: _buildDropdown<T>(labels, values, selected, onChanged),
        ))
      ],
    );
  }

  Widget _buildCategoryDropdown({
    required String? selected,
    required FilterChangedCallback<String> onChanged,
  }) {
    return _buildDropdownRow<String>(
      values: [null, ...hardcoded.categories],
      labels: ['Any Cuisine', ...hardcoded.categories],
      selected: selected,
      icon: Icons.fastfood,
      onChanged: onChanged,
    );
  }

  Widget _buildCityDropdown({
    required String? selected,
    required FilterChangedCallback<String> onChanged,
  }) {
    return _buildDropdownRow<String>(
      values: [null, ...hardcoded.cities],
      labels: ['Any Location', ...hardcoded.cities],
      selected: selected,
      icon: Icons.location_on,
      onChanged: onChanged,
    );
  }

  Widget _buildPriceDropdown({
    required int? selected,
    required FilterChangedCallback<int> onChanged,
  }) {
    return _buildDropdownRow<int>(
      values: [null, 1, 2, 3, 4],
      labels: ['Any Price', '\$', '\$\$', '\$\$\$', '\$\$\$\$'],
      selected: selected,
      icon: Icons.monetization_on,
      onChanged: onChanged,
    );
  }

  Widget _buildSortDropdown({
    required String? selected,
    required FilterChangedCallback<String> onChanged,
  }) {
    return _buildDropdownRow<String>(
      values: ['avgRating', 'numRatings'],
      labels: ['Rating', 'Reviews'],
      selected: selected,
      icon: Icons.sort,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.filter_list),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Text('Filter'),
          )
        ],
      ),
      content: Container(
        width: math.min(MediaQuery.of(context).size.width, 740),
        height: math.min(MediaQuery.of(context).size.height, 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCategoryDropdown(
                selected: _category,
                onChanged: (String? value) {
                  setState(() {
                    _category = value;
                  });
                }),
            _buildCityDropdown(
                selected: _city,
                onChanged: (String? value) {
                  setState(() {
                    _city = value;
                  });
                }),
            _buildPriceDropdown(
                selected: _price,
                onChanged: (int? value) {
                  setState(() {
                    _price = value;
                  });
                }),
            _buildSortDropdown(
                selected: _sort,
                onChanged: (String? value) {
                  setState(() {
                    _sort = value;
                  });
                })
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, Filter()),
            child: Text('CLEAR ALL')),
        ElevatedButton(
            onPressed: () => Navigator.pop(
                context,
                Filter(
                    category: _category,
                    city: _city,
                    price: _price,
                    sort: _sort)),
            child: Text('ACCEPT'))
      ],
    );
  }
}
