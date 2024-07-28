import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:ecommerceapp/features/feed/presentation/change_notifier/product_feed_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductFilter extends StatelessWidget {
  const ProductFilter({super.key, required this.searchController});


  final TextEditingController searchController;

  Future<void> openFilterSheet(BuildContext context) {

    void handleOnTap(Filter filter) {
      context.read<ProductFeedChangeNotifier>().setFilter(filter);
      Navigator.pop(context);
    }

    bool getSelectedFilter(Filter filter) {
      return context.read<ProductFeedChangeNotifier>().filter == filter;
    }

    TextStyle getTextStyle(Filter filter) {
      return TextStyle(
        color: getSelectedFilter(filter) ? Colors.blue : Colors.black,
      );
    }

    return showModalBottomSheet(context: context,
     builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Filter by'),
            Gap(12.h),
            InkWell(onTap: () => handleOnTap(Filter.price), child: Text('Price', style: getTextStyle(Filter.price))),
            const Divider(),
            InkWell(onTap: () => handleOnTap(Filter.rating), child: Text('Rating', style: getTextStyle(Filter.rating),)),
            const Divider(),
            InkWell(onTap: () => handleOnTap(Filter.availabilityStatus), child: Text('Availability Status', style: getTextStyle(Filter.availabilityStatus),)),
            const Divider(),
            InkWell(onTap: () => handleOnTap(Filter.review), child: Text('Review', style: getTextStyle(Filter.review),)),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                label: Text('Search Product'), 
              ),
              onChanged: (String value) => context.read<ProductFeedChangeNotifier>().setSearchQuery(searchController.text),
            ),
          ),
          InkWell(
            onTap: () => openFilterSheet(context),
            child: const Icon(
              Icons.filter_list,
            ),
          ),
        ],
      ),
    );
  }
}
