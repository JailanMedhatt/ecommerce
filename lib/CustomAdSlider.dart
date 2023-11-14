import 'package:ecommerce/MyTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAdSlider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ImageSlideshow(
          /// Width of the [ImageSlideshow].
          width: 400.w,

          /// Height of the [ImageSlideshow].
          height: 180.h,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: MyTheme.primaryBlue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          /// The widgets to display in the [ImageSlideshow].
          /// Add the sample image file into the images folder
          children: [
            Image.asset(
              'assets/images/ad.png',
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/images/ads_image.jpg',
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/images/ads_imagee.jpg',
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ],

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 3000,

          /// Loops back to first slide.
          isLoop: true,
        ),
      ),
    );
  }
}
