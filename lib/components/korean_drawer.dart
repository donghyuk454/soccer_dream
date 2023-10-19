import 'package:dream/components/player_toggle.dart';
import 'package:flutter/material.dart';

class KoreanDrawer extends StatefulWidget {
  final List<String> koreanList = ["손흥민", "황희찬", "이강인", "김민재", "손흥민", "황희찬", "이강인", "김민재", "손흥민", "황희찬", "이강인", "김민재",];
  List<bool> koreanActiveList = [true, true, false, false,true, true, false,false,true, true, false, false,];
  List<bool> koreanActiveBefore = [true, true, false, false,true, true, false,false,true, true, false, false,];
  bool isSaved = false;

  KoreanDrawer({super.key});

  @override
  State<KoreanDrawer> createState() => _KoreanDrawerState();
}

class _KoreanDrawerState extends State<KoreanDrawer> {

  @override
  Widget build(BuildContext context) {
    List<Widget> componentList = [];

    for (int i = 0; i < widget.koreanList.length; i++) {
      newOnChanged(v) {
        onChanged(v, i);
      }
      var component = PlayerToggle(playerName: widget.koreanList[i], isChecked: widget.koreanActiveList[i], onChanged: newOnChanged,);
      componentList.add(component);
    }

    ListView koreanListView = ListView.builder(
      itemCount: componentList.length,
      itemBuilder: (context, index) {
        return componentList[index];
      },
    );

    return
      DrawerHeader(
        child: Column (
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
              alignment: Alignment.centerLeft,
              child: Text("구독할 한국 선수"),
            ),
            Divider(thickness: 2,),
            Flexible(
              child: koreanListView
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text('저장'),
                onPressed: () {
                  saveState();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      );
  }

  @override
  void dispose() {
    if (!widget.isSaved) {
      loadState();
    }
    super.dispose();
  }

  onChanged(v, i) {
    setState(() {
      widget.koreanActiveList[i] = v;
    });
  }

  loadState() {
    print("loaded");
    for (var i = 0; i < widget.koreanActiveList.length; i++) {
      widget.koreanActiveList[i] = widget.koreanActiveBefore[i];
    }
  }

  saveState() {
    print("saved");
    for (var i = 0; i < widget.koreanActiveList.length; i++) {
      widget.koreanActiveBefore[i] = widget.koreanActiveList[i];
    }
  }
}
