import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/theme/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                    'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg'),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('ThePolymath',
                      style: AppTheme.h2Style
                          .copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onSurface)),
                  SizedBox(height: 20),
                  Text('Loyal Reader', style: AppTheme.h5Style.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              _estimateWidget('Followers', '826'),
              _estimateWidget('Following', '251'),
              _estimateWidget('News Read', '81K'),
            ],
          ),
          SizedBox(height: 30),
          Divider()
        ],
      ),
    );
  }

  Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(count,
              style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold,color:Colors.black)),
          SizedBox(height: 10),
          Text(text, style: AppTheme.h5Style.copyWith(color:Colors.black)),
        ],
      )),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            bool val = false;
            if (state is SelectedTheme) {
              val = state.themeType == ThemeType.Light ? true : false;
            }
            return SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _headerWidget(context),
                  )
                ],
              ),
            );
          },
        ));
  }
}
