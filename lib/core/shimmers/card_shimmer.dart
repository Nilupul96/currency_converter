import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../app_colors.dart';
import 'shimmer_config.dart';

class CardShimmer extends StatelessWidget {
  final int itemCount;
  final Axis axis;
  final double width;
  final EdgeInsets padding;
  final bool primary;
  final bool shrinkWrap;

  const CardShimmer(
      {Key? key,
      this.itemCount = 10,
      this.axis = Axis.horizontal,
      this.width = 300,
      this.padding = const EdgeInsets.only(right: 10),
      this.primary = false,
      this.shrinkWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: axis,
      itemCount: itemCount,
      primary: primary,
      shrinkWrap: shrinkWrap,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          direction: ShimmerConfig.shimmerDirection,
          baseColor: ShimmerConfig.baseColor,
          highlightColor: ShimmerConfig.highlightColor,
          period: ShimmerConfig.period,
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.bgBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 20.w,
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 9, top: 5, bottom: 5),
                          width: 2,
                          height: 20,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 20.w,
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 20.w,
                            height: 10,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 15.w,
                            height: 10,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 40.w,
                      height: 10,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
