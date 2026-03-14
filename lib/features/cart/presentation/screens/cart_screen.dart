import 'package:flower_app/features/cart/presentation/widgets/tab_bar_toggle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index; // Update selected tab
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBarToggle(
                selectedIndex: selectedIndex,
                onTabSelected: onTabSelected,
            ),
            Gap(60),
            selectedIndex == 0
            ?Center(child: Text("provider"),)
            :Center(child: Text("user"),)
          ],
        ),
      ),
    );
  }
}
