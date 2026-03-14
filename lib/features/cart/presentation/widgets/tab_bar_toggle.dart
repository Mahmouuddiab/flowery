import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class TabBarToggle extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TabBarToggle({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7F9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          // Up coming tab
          Expanded(
            child: _buildTabItem(
              title: "Provider",
              isSelected: selectedIndex == 0,
              onTap: () => onTabSelected(0),
            ),
          ),
          // History tab
          Expanded(
            child: _buildTabItem(
              title: "User",
              isSelected: selectedIndex == 1,
              onTap: () => onTabSelected(1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            color: isSelected ? Colors.white : const Color(0xFF183253),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}