import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../ui/helpers/size_extension.dart';
import '../ui/styles/text_styles.dart';

class MovieBanner extends StatelessWidget {
  const MovieBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.percentHeight(0.50),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.percentHeight(0.50),
            child: Image.asset(
              Assets.imagesBanner1,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: context.percentHeight(0.50),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.2, 0.5),
                radius: 1.4,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
                stops: const [0.6, 1],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 80),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                  width: 180,
                  child: Text(
                    'Os Melhores filmes de Suspense',
                    style: context.textStyles.bold,
                    textAlign: TextAlign.center,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
