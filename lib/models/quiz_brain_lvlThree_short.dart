import 'question.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:Lesaforrit/shared/audio.dart';

class QuizBrainLvlThreeShort {
  // Audio audio = Audio();
  AudioCache cache = AudioCache();
  AudioPlayer player = AudioPlayer();
  AudioPlayer spilari = AudioPlayer();
  int _question1 = 0;
  int _question2 = 0;
  int correct = 0;
  int trys = 0;
  String sound1;
  String sound2;
  int whichSound;
  int stars = 0;
  double finalscore;

  // H L J Ó Ð
  Future<AudioPlayer> playLocalAsset() async {
    if (whichSound == 1) {
      player = await cache.play(sound1);
      return player;
    } else {
      spilari = await cache.play(sound2);
      return spilari;
    }
  }

  void stop() async {
    if (whichSound == 1) {
      player.stop();
    } else {
      spilari.stop();
    }
  }

  List<Question> _questionBank = [
    Question('Lítil græn eðla', true, 'soundLevelThree/short/04.mp3'),
    Question('Ási hjólar hratt', true, 'soundLevelThree/short/05.mp3'),
    Question('Arna hljóp heim', true, 'soundLevelThree/short/08.mp3'),
    Question('Núna er rigning', true, 'soundLevelThree/short/12.mp3'),
    Question('Mikki drekkur kók', true, 'soundLevelThree/short/15.mp3'),
    Question('Klukkan er ellefu', true, 'soundLevelThree/short/19.mp3'),
    Question('Ég gleymdi töskunni', true, 'soundLevelThree/short/20.mp3'),
    Question('Magga klappar kisu', true, 'soundLevelThree/short/30.mp3'),
    //   Question('Elva klappar lambinu', true, 'soundLevelThree/short/36.mp3'),
    Question('Pabbi þvær þvottinn', true, 'soundLevelThree/short/40.mp3'),
    //  Question('Andrés vaknaði snemma', true, 'soundLevelThree/short/41.mp3'),
    Question('Himininn er bleikur', true, 'soundLevelThree/short/44.mp3'),
    Question('Sólin skein', true, 'soundLevelThree/short/54.mp3'),
    Question('Vatnið fraus', true, 'soundLevelThree/short/55.mp3'),
    Question('Hundar gelta', true, 'soundLevelThree/short/56.mp3'),
    Question('Fuglar syngja', true, 'soundLevelThree/short/57.mp3'),
    Question('Kisur mjálma', true, 'soundLevelThree/short/58.mp3'),
    Question('Fiskurinn syndir', true, 'soundLevelThree/short/59.mp3'),
    Question('Grænt gras', true, 'soundLevelThree/short/60.mp3'),
    Question('Bleikt blóm', true, 'soundLevelThree/short/61.mp3'),
    Question('Stór fluga', true, 'soundLevelThree/short/62.mp3'),
    Question('Hátt fjall', true, 'soundLevelThree/short/63.mp3'),
    Question('Afi saumar', true, 'soundLevelThree/short/64.mp3'),
    Question('Amma syngur', true, 'soundLevelThree/short/65.mp3'),
    Question('Siggi ropar', true, 'soundLevelThree/short/66.mp3'),
    Question('Palli hjólar', true, 'soundLevelThree/short/67.mp3'),
    Question('Pabbi skrifar', true, 'soundLevelThree/short/68.mp3'),
    Question('Stórir stafir', true, 'soundLevelThree/short/69.mp3'),
    Question('Lítið ljón', true, 'soundLevelThree/short/70.mp3'),
    Question('Mikki mús', true, 'soundLevelThree/short/71.mp3'),
    Question('Stórt tré', true, 'soundLevelThree/short/72.mp3'),
    Question('Harpa les', true, 'soundLevelThree/short/73.mp3'),
    Question('Alda hlær', true, 'soundLevelThree/short/74.mp3'),
    Question('Hestar hneggja', true, 'soundLevelThree/short/75.mp3'),
    Question('Mér er sama', true, 'soundLevelThree/short/77.mp3'),
    Question('Það er kalt', true, 'soundLevelThree/short/78.mp3'),
    Question('Hann hljóp út', true, 'soundLevelThree/short/79.mp3'),
    Question('Förum aðeins heim', true, 'soundLevelThree/short/80.mp3'),
    Question('Henni er kalt', true, 'soundLevelThree/short/81.mp3'),
    Question('Hann er uppi', true, 'soundLevelThree/short/82.mp3'),
    Question('Hún átti hjól', true, 'soundLevelThree/short/83.mp3'),
    Question('Lambið borðar gras', true, 'soundLevelThree/short/84.mp3'),
    Question('Siggi fékk kex', true, 'soundLevelThree/short/85.mp3'),
    Question('Ávextir eru hollir', true, 'soundLevelThree/short/86.mp3'),
    Question('Fiðrildið er fallegt', true, 'soundLevelThree/short/87.mp3'),
    Question('Eva borðar pulsur', true, 'soundLevelThree/short/88.mp3'),
    Question('Ég á síma', true, 'soundLevelThree/short/89.mp3'),
    Question('Mamma les bók', true, 'soundLevelThree/short/90.mp3'),
    Question('Sítrónan er súr', true, 'soundLevelThree/short/91.mp3'),
    Question('Appelsínan er sæt', true, 'soundLevelThree/short/92.mp3'),
    Question('Peysan er rifin', true, 'soundLevelThree/short/93.mp3'),
    Question('Óli spilar á flautu', true, 'soundLevelThree/short/94.mp3'),
    Question('Traktorinn er horfinn', true, 'soundLevelThree/short/95.mp3'),
    Question('Rútan er komin', true, 'soundLevelThree/short/96.mp3'),
    Question('Hér kemur strætó', true, 'soundLevelThree/short/97.mp3'),
  ];

  String getQuestionText1() {
    _question1 = Random().nextInt(_questionBank.length - 1);
    whichSound = Random().nextInt(2) + 1;
    sound1 = _questionBank[_question1].file;
    return _questionBank[_question1].questionText;
  }

  String getQuestionText2() {
    // þessi kóði passar bara að við fáum ekki sömu stafi. Annars er hann eins og getQuestionText1()
    _question2 = Random().nextInt(_questionBank.length - 1);
    whichSound = Random().nextInt(2) + 1;
    if (_question1 == _question2) {
      _question2++;
      sound2 = _questionBank[_question2].file;
      return _questionBank[_question2].questionText;
    } else
      sound2 = _questionBank[_question2].file;
    return _questionBank[_question2].questionText;
  }

  bool getCorrectAnswer() {
    if (whichSound == 1) return true;
    return false;
  }

  bool isFinished() {
    if (stars == 10) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    stars = 0;
    trys = 0;
    correct = 0;
    _question1 = 0; // kannski sleppa?
    _question2 = 0; // kannski sleppa?
  }
}