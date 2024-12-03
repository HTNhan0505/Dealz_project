import 'package:audioplayers/audioplayers.dart';
import 'package:dealz_app/views/chat_screen.dart';
import 'package:flutter/material.dart';

import '../resources/colors/app_colors.dart';

class VoiceScreen extends StatefulWidget {
  @override
  _VoiceScreenState createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
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
        backgroundColor: AppColors.whiteColor,
        title: Text('APP DEALZ'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              ClipOval(
                child: Image.asset(
                  'lib/resources/splash_screen.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 52),


              GestureDetector(
                onTap: null,
                child: Container(
                  width: 66.0, // Kích thước nút
                  height: 66.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.mic, // Biểu tượng mic
                    color: Colors.black, // Màu biểu tượng
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),)
        ,
      )
      ,
    );
  }
}
