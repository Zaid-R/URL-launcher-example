import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final Website website;

  const DetailsPage({
    super.key,
    required this.website,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('API: ${website.api}'),
            ),
            ListTile(
              title: Text('Description: ${website.description}'),
            ),
            ListTile(
              title: Text('Auth: ${website.auth}'),
            ),
            ListTile(
              title: Text('HTTPS: ${website.isHttps}'),
            ),
            ListTile(
              title: Text('CORS: ${website.cors}'),
            ),
            ListTile(
              title: Wrap(
                children: [
                  const Text('Link: '),
                  InkWell(
                    onTap: () {
                      _launchURL(Uri.parse(website.link));
                    },
                    child: Text(
                      website.link,
                       overflow: TextOverflow.clip,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Category: ${website.category}'),
            ),
          ].map((listTile) =>Column(children: [listTile,buildDivider()],)).toList(),
        
        ),
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url,mode: LaunchMode.inAppBrowserView);
    } else {
      throw 'Could not launch $url';
    }
  }
}
