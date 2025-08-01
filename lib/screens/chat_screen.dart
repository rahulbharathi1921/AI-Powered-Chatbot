import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../model/message.dart';
import '../services/apiServices.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final GeminiApiService apiService = GeminiApiService();

  List<Message> msgs = [];
  bool isTyping = false;

  void sendMsg() async {
    String text = controller.text;
    controller.clear();

    if (text.isEmpty) return;

    setState(() {
      msgs.insert(0, Message(true, text));
      isTyping = true;
    });

    try {
      String reply = await apiService.sendMessage(text);
      setState(() {
        msgs.insert(0, Message(false, reply));
        isTyping = false;
      });
    } catch (e) {
      setState(() => isTyping = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Bot"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => msgs.clear()),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: msgs.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = msgs[index];
                return Align(
                  alignment: message.isSender
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isSender
                          ? Colors.blue.shade100
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: MarkdownBody(data: message.msg),
                  ),
                );
              },
            ),
          ),
          if (isTyping)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Typing..."),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (_) => sendMsg(),
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: sendMsg,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

