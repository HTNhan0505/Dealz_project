import 'package:audioplayers/audioplayers.dart';
import 'package:dealz_app/views/chat_screen.dart';
import 'package:dealz_app/views/voice_screen.dart';
import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';

class D5Q5VoiceText extends StatefulWidget {
  @override
  _D5Q5VoiceTextState createState() => _D5Q5VoiceTextState();
}

class _D5Q5VoiceTextState extends State<D5Q5VoiceText> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
    _playAudioOnInit();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();

    super.dispose();
  }

  Future<void> _playAudioOnInit() async {
    try {
      await _audioPlayer.play(AssetSource('mp3_flutter.mp3'));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: GestureDetector(onTap: () {}, child: Text('')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),

              ClipOval(
                child: Image.asset(
                  'lib/resources/splash_screen.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 32),

              // Hàng chứa 2 nút
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nút Voice
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => VoiceScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      "Voice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Nút Text
                  ElevatedButton(
                    onPressed: () {
                      _audioPlayer.pause();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => ChatScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      "Text",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  
}
