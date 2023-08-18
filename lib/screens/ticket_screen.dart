import 'package:bookingticket/screens/ticket_tabs.dart';
import 'package:bookingticket/screens/ticket_view.dart';
import 'package:bookingticket/utils/app_info_list.dart';
import 'package:bookingticket/utils/app_layout.dart';
import 'package:bookingticket/utils/app_styles.dart';
import 'package:bookingticket/widgets/column_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getWidth(20),
              horizontal: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "Tickets",
              style: Styles.headLineStyle1,
            ),
            Gap(AppLayout.getHeight(20)),
            const AppTicketTans(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(
                ticket: ticketList[0],
                isColor: true,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppColumnLayout(
                      firstText: "Flutter DB",
                      secondText: "Passenger",
                      alignment: CrossAxisAlignment.start,
                      isColor: true,
                    ),
                    AppColumnLayout(
                      firstText: "5221 36489",
                      secondText: "passport",
                      alignment: CrossAxisAlignment.end,
                      isColor: true,
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ]),
    );
  }
}
