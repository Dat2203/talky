import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _posiotionData =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream, (position, bufferedPosition, duration) {
        return PositionData(
            duration: duration ?? Duration.zero,
            bufferedPosition: bufferedPosition,
            position: position);
      });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer()
      ..setAsset('assets/audio/KhiNguoiMinhYeuKhoc-PhanManhQuynh-4291421.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_down_rounded),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.view_headline))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF114771), Color(0xFF071A2C)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PositionData>(
              stream: _posiotionData,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return ProgressBar(
                  barHeight: 8,
                    baseBarColor: Colors.grey[600],
                    bufferedBarColor: Colors.grey,
                    timeLabelTextStyle: TextStyle(
                      color: Colors.white
                    ),
                    progressBarColor: Colors.blue,
                    thumbColor: Colors.blue,
                    onSeek: _audioPlayer.seek,
                    progress: positionData?.position ?? Duration.zero,
                    buffered:  positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Controlls(audioPlay: _audioPlayer)
          ],
        ),
      ),
    );
  }
}

class Controlls extends StatelessWidget {
  Controlls({super.key, required this.audioPlay});

  final AudioPlayer audioPlay;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlay.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final isPlaying = playerState?.playing;
          if (isPlaying != null && isPlaying) {
            print("is playing");
            return IconButton(
                onPressed: audioPlay.pause,
                color: Colors.white,
                iconSize: 80,
                icon: Icon(Icons.pause));
          }

          return IconButton(
              onPressed: audioPlay.play,
              color: Colors.white,
              iconSize: 80,
              icon: Icon(Icons.play_arrow));
        });
  }
}

class PositionData {
  final Duration duration;
  final Duration bufferedPosition;
  final Duration position;

  PositionData(
      {required this.duration,
      required this.bufferedPosition,
      required this.position});
}
