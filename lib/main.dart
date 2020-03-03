import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carsome/data/album_response.dart';
import 'package:flutter_carsome/notifier/home_notifier.dart';
import 'package:flutter_carsome/util/app_strings.dart';
import 'package:flutter_carsome/util/color_constant.dart';
import 'package:flutter_carsome/util/progress_bar.dart';
import 'package:flutter_carsome/util/size_attribute.dart';
import 'package:flutter_carsome/util/widget_utils.dart';
import 'package:provider/provider.dart';

import 'base/base_state.dart';

void main() => runApp(CarsomeHome());

class CarsomeHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarsomeState();
  }
}

class CarsomeState extends BaseState<CarsomeHome> {
  double _width;

  @override
  void initState() {
    AutoOrientation.portraitAutoMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blueGrey,
        primaryColor: colorPrimary,
      ),
      home: ChangeNotifierProvider<HomeNotifier>(
        create: (BuildContext context) => HomeNotifier(),
        child: Consumer<HomeNotifier>(
          builder:
              (BuildContext context, HomeNotifier homeNotifier, Widget child) {
            _width = SizeConstant().deviceWidth(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  APP_NAME,
                  style: customTextStyle(color: Colors.white, size: 23),
                ),
                centerTitle: true,
              ),
              body: _buildBody(homeNotifier, _width),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(HomeNotifier homeNotifier, double width) {
    print('===> $width');
    double spanCount = width / 150;

    return homeNotifier.isLoading
        ? loadingIndicator()
        : Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: homeNotifier.isPortrait
                          ? Colors.amber
                          : Colors.grey[300],
                      child: Text('1'),
                      onPressed: () {
                        AutoOrientation.portraitAutoMode();
                        homeNotifier.isPortrait = true;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: homeNotifier.isPortrait
                          ? Colors.grey[300]
                          : Colors.amber,
                      child: Text('2'),
                      onPressed: () {
                        homeNotifier.isPortrait = false;
                        AutoOrientation.landscapeLeftMode();
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: spanCount.toInt(),
//                  crossAxisCount: homeNotifier.isPortrait ? 2 : 5,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: List.generate(
                    homeNotifier.isPortrait
                        ? homeNotifier.albumList.length
                        : homeNotifier.albumListLandscape.length,
                    (index) {
                      return AlbumCells(
                        homeNotifier.isPortrait
                            ? homeNotifier.albumList[index]
                            : homeNotifier.albumListLandscape[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}

class AlbumCells extends StatelessWidget {
  @required
  final AlbumResponse album;

  const AlbumCells(this.album);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: Image.network(album.thumbnailUrl),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              album.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
