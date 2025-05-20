import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class SoundController extends GetxController {
  /// Index of currently playing track, or -1 if none.
  final playingIndex = RxInt(-1);

  /// Underlying audio player
  final _player = AudioPlayer();

  /// Paths to your audio assets
  final List<String> paths = [
    'assets/sounds/song1.mp3',
    'assets/sounds/song2.mp3',
    'assets/sounds/song3.mp3',
  ];

  /// One waveform controller per track
  late final List<PlayerController> waveControllers;


  @override
  void onInit() {
    super.onInit();
    waveControllers = paths.map((path) {
      final c = PlayerController();
      c.preparePlayer(
        path: path,
        shouldExtractWaveform: true,
      );
      return c;
    }).toList();
  }

  /// Toggle play/pause for track [index]
  Future<void> toggle(int index) async {
    if (playingIndex.value == index) {
      await _player.stop();
      playingIndex.value = -1;
    } else {
      if (playingIndex.value >= 0) {
        await _player.stop();
      }
      playingIndex.value = index;
      await _player.play(DeviceFileSource(paths[index]));
    }
  }
}
