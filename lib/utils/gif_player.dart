import 'dart:async';
import 'package:flutter/material.dart';

class GifPlayer extends StatefulWidget {
  final String gifPath;
  final VoidCallback? onGifCompleted; // Callback function for GIF completion
  const GifPlayer({Key? key, required this.gifPath, this.onGifCompleted}) : super(key: key);

  @override
  State<GifPlayer> createState() => _GifPlayerState();
}

class _GifPlayerState extends State<GifPlayer> {
  late ImageStream _imageStream;
  bool _isGifPlaying = true;
  int prevStreamUpdateCount  = 0;
  int newStreamUpdateCount  = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
       if(prevStreamUpdateCount == newStreamUpdateCount) {
         _timer.cancel();
         widget.onGifCompleted?.call();
         print('************ GIF finished completed!');
       } else {
         prevStreamUpdateCount = newStreamUpdateCount;
       }
    });

    _imageStream = Image.asset(
      widget.gifPath,
      gaplessPlayback: true,
    ).image.resolve(ImageConfiguration.empty);
    _imageStream.addListener(ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        // Called when a new frame is available
        newStreamUpdateCount += 1;
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        // Handle error
      },
      onChunk: (ImageChunkEvent? event) {
        // Check if the GIF has finished playing
        if (event?.expectedTotalBytes != null && event?.cumulativeBytesLoaded == event?.expectedTotalBytes) {
          setState(() {
            _isGifPlaying = false;
          });
          // Perform actions after GIF completion
          // Invoke the onGifCompleted callback if it's not null
        }
       },
    ));
  }

  @override
  void dispose() {
    _timer.cancel();
    _imageStream.removeListener(ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        // Called when a new frame is available
      },
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.gifPath,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
