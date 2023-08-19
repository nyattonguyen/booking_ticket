import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppTicketTans extends StatefulWidget {
  final String firstTab;
  final String secondTab;
  final Function(bool) onTabChanged;

  const AppTicketTans({
    Key? key,
    required this.firstTab,
    required this.secondTab,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  _AppTicketTansState createState() => _AppTicketTansState();
}

class _AppTicketTansState extends State<AppTicketTans> {
  bool isFirstTabSelected = true;

  void _toggleTabs() {
    setState(() {
      isFirstTabSelected = !isFirstTabSelected;
      widget.onTabChanged(isFirstTabSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(3.5),
        child: Row(
          children: [
            GestureDetector(
              onTap: _toggleTabs, // Bắt sự kiện khi click vào Tab 1
              child: Container(
                width: size.width * 0.44,
                padding: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(50)),
                  color: isFirstTabSelected ? Colors.white : Colors.transparent,
                ),
                child: Center(child: Text(widget.firstTab)),
              ),
            ),
            Gap(4),
            GestureDetector(
              onTap: _toggleTabs, // Bắt sự kiện khi click vào Tab 2
              child: Container(
                width: size.width * 0.44,
                padding: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(50)),
                  color: isFirstTabSelected ? Colors.transparent : Colors.white,
                ),
                child: Center(child: Text(widget.secondTab)),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFF4F6FD),
        ),
      ),
    );
  }
}
