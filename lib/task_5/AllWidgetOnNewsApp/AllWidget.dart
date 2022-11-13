import 'package:flutter/material.dart';

import '../Constant/ConstantVariable.dart';

class CategoricalBar extends StatefulWidget {
  final int? index;
  final VoidCallback? onSelect;
  final String? pathOfImage;
  final bool isSelected;
  final String? nameOfCategorical;
  const CategoricalBar({
    Key? key,
    this.pathOfImage,
    this.nameOfCategorical,
    this.isSelected =true,
    this.index, this.onSelect,
  }) : super(key: key);
  @override
  _CategoricalBarState createState() => _CategoricalBarState();
}


class _CategoricalBarState extends State<CategoricalBar> {
  @override
  Widget build(BuildContext context) {
    bool isActive;
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: <Widget> [
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  border:widget.isSelected?
                  Border.all(color: borderOfSelectedCategorical,width: 4)
                      :Border.all(color: borderOfCategorical,width: 2)

                ),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(nameAndImageOfCategoricalBar[widget.index!].pathOfImage!),
                ),
              ),
            Text(nameAndImageOfCategoricalBar[widget.index!].nameOfCategorical!,style: const TextStyle(fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
