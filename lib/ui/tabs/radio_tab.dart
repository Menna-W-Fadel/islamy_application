import 'package:flutter/material.dart';
import 'package:islamy_application/common/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          Center(
              child: Image.asset(
            AppImages.radioImage,
            width: MediaQuery.of(context).size.width * 0.55,
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.eza3etQuraan,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.fast_rewind,
                size: MediaQuery.of(context).size.width * 0.07,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              Icon(
                Icons.play_arrow,
                size: MediaQuery.of(context).size.width * 0.10,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              Icon(
                Icons.fast_forward,
                size: MediaQuery.of(context).size.width * 0.07,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          )
        ],
      ),
    );
  }
}
