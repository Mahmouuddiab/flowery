import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  CategoryEntity categoryEntity;
  TabItem({super.key,required this.isSelected,required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected?Colors.green:Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.green,width: 1.5)
      ),
      child: Text(
        categoryEntity.name,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: isSelected?AppColors.white:AppColors.primary,
      ),
      ),
    );
  }
}
