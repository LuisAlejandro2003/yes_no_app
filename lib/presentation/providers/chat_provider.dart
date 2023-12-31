import 'package:flutter/widgets.dart';
import 'package:yes_no_app/entities/message.dart';
import '../../config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer= GetYesNoAnswer();

  List<Message> messageList = [
   
  ];
  
  Future<void>sendMessage(String text )async{
    if(text.isEmpty) return;
    
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    if (text.endsWith('?')){
     herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

   Future <void>herReply()async{
    final herMessage = await getYesNoAnswer.getAnswer();
   messageList.add(herMessage);
   notifyListeners();
   moveScrollToBottom();
   }

  Future <void> moveScrollToBottom()async{
    
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut);
  }
  
}