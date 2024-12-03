import 'package:dealz_app/components/global_pop_up.dart';
import 'package:dealz_app/components/success_update_ui.dart';
import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:dealz_app/views/d8_q5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: const Text("APP DEALZ (O.S)",
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  // Widget danh sách tin nhắn
  Widget _buildMessageList() {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return Align(
          alignment: Alignment.centerRight, // Tin nhắn căn lề trái
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(message, style: const TextStyle(fontSize: 16.0)),
          ),
        );
      },
    );
  }

  // Widget thanh nhập liệu
  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.borderDialog,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 12),
                  suffixIcon: GestureDetector(
                    onTap: _sendMessage,
                    child: const Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                  hintText: "Trả lời",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hàm gửi tin nhắn
  void _sendMessage() {
    final text = _messageController.text.trim();
    FocusScope.of(context).unfocus();
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, text);
      });
      GlobalPopup().show(
          context, 'Thiết lập', 'Xác nhận chọn Dealz thiết lập riêng?', () {
        GlobalPopup().hide();
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => D8q5Screen(
                 ),
            ));
      });
      _messageController.clear(); // Xoá nội dung TextField
    }
  }
}
