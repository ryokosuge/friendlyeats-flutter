import 'package:flutter/material.dart';
import '../model/filter.dart';

const _boldStyle = TextStyle(fontWeight: FontWeight.bold);

class FilterBar extends StatelessWidget {
  FilterBar({
    Filter? filter,
    required VoidCallback onPressed,
  })  : _onPressed = onPressed,
        _filter = filter;

  final VoidCallback _onPressed;
  final Filter? _filter;

  List<InlineSpan> _buildCategorySpans(Filter? filter) {
    final noneSelected =
        filter == null || filter.isDefault || filter.category == null;
    return [
      if (noneSelected) TextSpan(text: "All Restaurants", style: _boldStyle),
      if (!noneSelected) ...[
        TextSpan(text: '${filter?.category ?? "-"}', style: _boldStyle),
        TextSpan(text: ' places'),
      ]
    ];
  }

  List<InlineSpan> _buildPriceSpans(Filter? filter) {
    return [
      if (filter?.price != null) ...[
        TextSpan(text: ' of '),
        TextSpan(text: '\$' * (filter?.price ?? 1), style: _boldStyle)
      ]
    ];
  }

  List<InlineSpan> _buildTitleSpans(Filter? filter) {
    return [
      ..._buildCategorySpans(filter),
      if (filter != null && !filter.isDefault) ..._buildPriceSpans(filter),
    ];
  }

  List<InlineSpan> _buildCitySpans(Filter? filter) {
    return [
      if (filter?.city != null) ...[
        TextSpan(text: ' in '),
        TextSpan(text: '${filter?.city ?? "-"}', style: _boldStyle),
      ]
    ];
  }

  List<InlineSpan> _buildSubtitleSpans(Filter? filter) {
    final orderedByRating =
        filter == null || filter.sort == null || filter.sort == 'avgRating';
    return [
      if (filter != null) ..._buildCitySpans(filter),
      if (orderedByRating) TextSpan(text: 'by rating'),
      if (!orderedByRating) TextSpan(text: 'by # reviews'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.all(6)),
      ),
      onPressed: _onPressed,
      child: Row(
        children: [
          Icon(Icons.filter_list),
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: _buildTitleSpans(_filter),
                  ),
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.caption,
                    children: _buildSubtitleSpans(_filter),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
