import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/radio_item.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  const RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Obx(() => Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(4),
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: _item.isSelected.value
                          ? Colors.blueAccent
                          : Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(2.0)),
                    ),
                    child: Center(
                      child: Text(_item.buttonText,
                          style: TextStyle(
                              color: _item.isSelected.value
                                  ? Colors.white
                                  : Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontSize: 14.0)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        _item.text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
