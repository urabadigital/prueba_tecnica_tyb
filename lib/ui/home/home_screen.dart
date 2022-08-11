import 'package:flutter/material.dart';
import 'package:tyba/domain/repository/university_api.dart';
import 'package:tyba/main.dart';
import 'package:tyba/ui/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../widget/university_details.dart';
import '../widget/university_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._({super.key});

  static Widget create({Key? key}) => ChangeNotifierProvider(
        lazy: false,
        create: (context) => HomeProvider(
          universityApi: context.read<UniversityApi>(),
        )..loadUniversitys(),
        child: HomeScreen._(key: key),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layout = 'list';
  
  @override
  Widget build(BuildContext context) {
    final result = context.watch<HomeProvider>().universityList;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: result == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Universidades',
                          style: textTheme.headline4?.copyWith(fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<ThemeProvider>().changeTheme();
                          },
                          icon: const Icon(
                            Icons.lightbulb,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Buscar universidad ... '),
                    const SizedBox(height: 5),
                    TextField(
                      onChanged: (val) {
                        context.read<HomeProvider>().searchUniversity(val);
                      },
                      decoration: InputDecoration(
                        hintText: 'Escribir universidad',
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary,),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        leading: Icon(
                          Icons.category,
                          color: Theme.of(context).hintColor,
                        ),
                        title: Text(
                          'Universidades',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  layout = 'list';
                                });
                              },
                              icon: Icon(
                                Icons.format_list_bulleted,
                                color: layout == 'list' ? Theme.of(context).colorScheme.primary : Theme.of(context).focusColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  layout = 'grid';
                                });
                              },
                              icon: Icon(
                                Icons.apps,
                                color: layout == 'grid' ? Theme.of(context).colorScheme.primary : Theme.of(context).focusColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: layout == 'list' ? const UniversityList() : const UniversityGrid(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class UniversityGrid extends StatelessWidget {
  const UniversityGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final universitys = context.watch<HomeProvider>().searchList;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: universitys?.length ?? 0,
        itemBuilder: (context, index) {
          final university = universitys![index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(university: university)));
            },
            child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  university.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  university.country,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                university.webPages.first,
                style: Theme.of(context).textTheme.bodyText1?.merge(const TextStyle(
                    fontSize: 11,
                  )),
                overflow: TextOverflow.ellipsis,
                ),
                Text(
                  university.domains.first,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          );
        },
    );  
  }
}


class UniversityList extends StatelessWidget {
  const UniversityList({super.key});

  @override
  Widget build(BuildContext context) {
    final universitys = context.watch<HomeProvider>().searchList;
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: universitys?.length ?? 0,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        final university = universitys![index];
        return UniversityListWidget(
          heroTag: 'university_list',
          university: university,
        );
      },
    );
  }
}