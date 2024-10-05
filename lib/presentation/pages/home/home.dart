import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hovering/hovering.dart';
import 'package:planets/presentation/widgets/background.dart';
import 'package:planets/routes/router.names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        //movil
        if (MediaQuery.of(context).size.width < 600) {
          return _body(context, size, size.width * 0.25);
          //tablet
        } else if (MediaQuery.of(context).size.width < 1024) {
          return _body(context, size, size.width * 0.2);
          //web
        } else {
          return _body(context, size, size.width * 0.1);
        }
      },
    );
  }

  _body(BuildContext context, Size size, double buttonWidght) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: InkWell(
            onTap: () {
              context.go(RouteNames.planets);
            },
            child: HoverAnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.lightBlue),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              hoverDecoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: size.height * 0.08,
              width: buttonWidght,
              child: Center(
                  child: AutoSizeText(
                'Ver Planetas',
                minFontSize: size.height * 0,
                style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
