import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  CountryCard(
                    countryName: 'China',
                    avatarImage: 'assets/images/china.png',
                    language: 'Chinese',
                  ),
                  CountryCard(
                    countryName: 'Germany',
                    avatarImage: 'assets/images/germen.png',
                    language: 'Deutsch',
                  ),
                  CountryCard(
                    countryName: 'USA',
                    avatarImage: 'assets/images/usa.png',
                    language: 'English',
                  ),
                  CountryCard(
                    countryName: 'Pakistan',
                    avatarImage: 'assets/images/pak.png',
                    language: 'Urdu',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String countryName;
  final String avatarImage;
  final String language;

  const CountryCard({
    Key? key,
    required this.countryName,
    required this.avatarImage,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // Handle card tap
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Language on $countryName')),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatarImage),
          ),
          title: Text(countryName),
          subtitle: Text(language),
        ),
      ),
    );
  }
}
