import 'package:flutter/material.dart';
import 'package:meditation_app/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/utils/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
            child: orientation == Orientation.portrait
                ? Stack(children: [
                    const FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.32,
                        child: GetStartedHeader()),
                    const GetStartedBackground(),
                    Align(
                        alignment: const Alignment(0.0, 0.9),
                        child: GetStartedButton(
                            fixedSize: MaterialStateProperty.all(
                              Size(
                                size.width * 0.85,
                                size.height * 0.065,
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              PrimaryFont.medium(size.height * 0.015),
                            )))
                  ])
                : Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: size.height * 0.5,
                              child: const GetStartedHeader())),
                      Expanded(
                          child: Stack(children: [
                        const GetStartedBackground(),
                        Align(
                            alignment: const Alignment(0.0, 0.9),
                            child: GetStartedButton(
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                  size.width * 0.4,
                                  size.height * 0.065,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(
                                PrimaryFont.medium(size.height * 0.015),
                              ),
                            ))
                      ])),
                    ],
                  )));
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset('assets/icons/logo.svg',
              alignment: const Alignment(0, -0.7))),
      Flexible(
        flex: 2,
        fit: FlexFit.tight,
        child: FractionallySizedBox(
          widthFactor: 0.65,
          child: FittedBox(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Hi Tien Vi, Welcome\n',
                    style: PrimaryFont.medium(30)
                        .copyWith(color: AppColors.lightYellow),
                    children: [
                      TextSpan(
                          text: 'to Silent Moon',
                          style: PrimaryFont.thin(30)
                              .copyWith(color: AppColors.lightGrey))
                    ])),
          ),
        ),
      ),
      Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Flexible(
              child: Text(
                  'Explore the app, Find some peace of mind to prepare for meditation app',
                  textAlign: TextAlign.center,
                  style: PrimaryFont.thin(16)
                      .copyWith(color: AppColors.lightGrey)),
            ),
          ),
        ),
      ),
    ]);
  }
}

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
              heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
              widthFactor: 1,
              child: FittedBox(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.antiAlias,
                  child:
                      SvgPicture.asset('assets/images/welcome_banner.svg')))),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    this.fixedSize,
    this.textStyle,
  }) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.lightGrey),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(AppColors.darkGrey),
        textStyle: textStyle,
      ),
      child: const Text('GET STARTED'),
    );
  }
}
