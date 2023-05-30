import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_place/utils/extensions.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth(),
      height: context.screenHeight(.065),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: SvgPicture.asset(
                'search-noun'.svg,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 50, // Adjust this value as needed
              minHeight: 10, // Adjust this value as needed
            ),
            hintText: " Search..",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
