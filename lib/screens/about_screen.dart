import 'package:flutter/material.dart';
import 'package:research_point/utils/theme_util.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    Uri parsedUrl = Uri.parse(url);
    if (!await launchUrl(parsedUrl)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Powered By card
          Expanded(
            flex: 1,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 2.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 32.0,
                        bottom: 0.0,
                      ),
                      child: Image.asset(
                        'assets/images/core-ac-logo.png',
                        height: MediaQuery.of(context).size.height * 0.10,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Powered By',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              _launchUrl('https://core.ac.uk/');
                            },
                            child: Text(
                              'Core.ac.uk',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ThemeUtil.primaryColor),
                            ),
                          ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Designed By Card
        ],
      ),
    );
  }
}
