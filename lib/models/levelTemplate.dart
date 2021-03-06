import 'package:Lesaforrit/components/QuestionCard.dart';
import 'package:Lesaforrit/components/reusable_card.dart';
import 'package:Lesaforrit/components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lesaforrit/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LevelTemplate extends StatelessWidget {
  static const String id = 'level_template';
  double soundCircleSize;
  double soundPad;
  double soundPadBottom;
  double soundIconSize;
  bool enabled;
  String upperLetterImage;
  String lowerLetterImage;
  String letterOne;
  String letterTwo;
  Function onPressed;
  Function onPress;
  Function onPress2;
  List<Icon> scoreKeeper;
  String trys;
  String correct;
  String stig;
  Color cardColor;
  Color stigColor;
  double fontSize;
  Widget bottomBar;
  int shadowLevel;

  LevelTemplate(
      {this.soundCircleSize,
      this.soundPad,
      this.soundPadBottom,
      this.soundIconSize,
      this.enabled,
      this.upperLetterImage,
      this.lowerLetterImage,
      this.letterOne,
      this.letterTwo,
      this.onPressed,
      this.onPress,
      this.onPress2,
      this.scoreKeeper,
      this.trys,
      this.correct,
      this.stig,
      this.cardColor,
      this.stigColor,
      this.fontSize,
      this.bottomBar,
      this.shadowLevel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // B L Á A  K O R T I Ð
      decoration: BoxDecoration(
        color: cardColor, // - - - * * - - -//
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(55), topRight: Radius.circular(55)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.50),
            spreadRadius: 6,
            blurRadius: 15,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // H L J Ó Ð T A K K I /////////////////////////////////////////////////////////////////////////////////////////
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, soundPad + 25, 0, soundPadBottom),
                child: RoundIconButton(
                  icon: Icons.volume_up,
                  iconSize: soundIconSize,
                  circleSize: soundCircleSize,
                  onPressed: onPressed,
                ),
              ),
            ],
          ),

          // E F R I  S T A F U R ////////////////////////////////////////////////////////////////////////
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(upperLetterImage, fit: BoxFit.contain),
                ),
                Container(
                  child: QuestionCard(
                    cardChild: AutoSizeText(
                      letterOne,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Metropolis-Regular.otf',
                        fontWeight: FontWeight.w800,
                        fontSize: fontSize,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 20.0,
                            color: Color.fromARGB(shadowLevel, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    onPress: onPress,
                  ),
                ),
              ],
            ),
          ),
          // N E D R I  S T A F U R ////////////////////////////////////////////////////////////////////////
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(lowerLetterImage, fit: BoxFit.contain),
                ),
                Container(
                  child: QuestionCard(
                    cardChild: AutoSizeText(
                      letterTwo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Metropolis-Regular.otf',
                        fontWeight: FontWeight.w800,
                        fontSize: fontSize,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 20.0,
                            color: Color.fromARGB(shadowLevel, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    onPress: onPress2,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // F J Ö L D I   R É T T   G I S K A Ð / Tilraunir
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 17, bottom: 15, top: 0),
                      child: ReusableCard(
                        height: 35,
                        colour: stigColor, // - - - * * - - -//
                        cardChild: Text(
                          'RÉTT :  ' + correct + ' af ' + trys,
                          style: correctTrys,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      // S T I G
                      padding: const EdgeInsets.only(
                          left: 15, right: 25, bottom: 15, top: 0),
                      child: ReusableCard(
                        height: 35,
                        colour: stigColor, // - - - * * - - -//
                        cardChild: Text(stig, style: points),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 24.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(maxHeight: 35, minHeight: 34),
                            child: SizedBox(
                              height: 35,
                              child: Container(
                                child: ReusableCard(
                                  colour: Colors.white,
                                  cardChild: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: scoreKeeper,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: bottomBar,
          ),
        ],
      ),
    );
  }
}
