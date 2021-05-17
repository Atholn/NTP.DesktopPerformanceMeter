import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Container(
        height: double.infinity,

        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Row(
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/car.png',
                height: 55.0,
                filterQuality: FilterQuality.high,
              ),
            ),
          */ ),
            _SideMenuIconTab(
              iconData: Icons.home,
              title: 'Home',
              onTap: () {},
            ),
            _SideMenuIconTab(
              iconData: Icons.search,
              title: 'Search',
              onTap: () {},
            ),
            _SideMenuIconTab(
              iconData: Icons.audiotrack,
              title: 'Radio',
              onTap: () {},
            ),


          ],
        )
    );
  }
}


class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key key,
    IconData this.iconData,
    String this.title,
    VoidCallback this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayList extends StatefulWidget {
  const _LibraryPlayList({Key key}) : super(key: key);

  @override
  __LibraryPlayListState createState() => __LibraryPlayListState();
}

class __LibraryPlayListState extends State<_LibraryPlayList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      physics: const ClampingScrollPhysics(),
      children: [
        Column(
          children: [
          ],
        )
      ],
    );
  }
}

