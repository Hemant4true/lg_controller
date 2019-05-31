import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_controller/src/blocs/PageBloc.dart';
import 'package:lg_controller/src/menu/NavBarMenu.dart';
import 'package:lg_controller/src/states_events/PageActions.dart';

class NavBar extends StatelessWidget {
  NavBar();

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getLabels(context),
      ),
    );
  }

  List<Widget> getLabels(context) {
    List<Widget> list = new List<Widget>();
    list.add(
      SizedBox(
        height: 24,
      ),
    );
    list.add(
      Text("CATEGORIES : ", style: Theme.of(context).textTheme.body2),
    );
    list.add(
      SizedBox(
        height: 12,
      ),
    );
    list.add(Divider(color: Colors.white70));
    list.add(
      SizedBox(
        height: 16,
      ),
    );
    for (var ic in NavBarMenu.values()) {
      list.add(
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => labelSelected(ic, context),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(ic.title, style: Theme.of(context).textTheme.body1),
              ),
            ),
          ],
        ),
      );
    }
    return list;
  }

  labelSelected(NavBarMenu ic, context) {
    switch (ic) {
      case NavBarMenu.RECENTLY_VIEWED:
        {
          BlocProvider.of<PageBloc>(context).dispatch(HOME(null));
        }
        break;
      case NavBarMenu.CATEGORY_1:
        {
          BlocProvider.of<PageBloc>(context).dispatch(TOUR());
        }
        break;
      case NavBarMenu.CATEGORY_2:
        {
          BlocProvider.of<PageBloc>(context).dispatch(POI());
        }
        break;
      case NavBarMenu.CATEGORY_3:
        {
          BlocProvider.of<PageBloc>(context).dispatch(GUIDE());
        }
        break;
      case NavBarMenu.CATEGORY_4:
        {
          BlocProvider.of<PageBloc>(context).dispatch(OVERLAY());
        }
        break;
      case NavBarMenu.CATEGORY_5:
        {
          BlocProvider.of<PageBloc>(context).dispatch(OVERLAY());
        }
        break;
      default:
        {}
    }
  }
}
