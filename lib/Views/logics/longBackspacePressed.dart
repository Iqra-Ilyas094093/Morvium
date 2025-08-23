import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class LongBackSpacePressed {
  void deleteWord(TextEditingController searchController) {
    final text = searchController.text;
    if (text.isEmpty) return;
    final lastSpace = text.lastIndexOf('');
    if (lastSpace == -1) {
      searchController.clear();
    } else {
      searchController.text = text.substring(0, lastSpace);
      searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: searchController.text.length));
    }
  }

   handleBackspaceKey

  (

  KeyEvent event,TextEditingController searchController, Ticker ticker,bool isBackspacePressed){
  if(event.logicalKey == LogicalKeyboardKey.backspace && event is KeyDownEvent){
  if(!isBackspacePressed){
  isBackspacePressed = true;
  ticker.start();
  deleteWord(searchController);
  }else{
  isBackspacePressed =false;
  ticker.stop();
  }
  }
  }
}