import 'package:bookingticket/screens/ticket_tabs.dart';
import 'package:bookingticket/screens/ticket_view.dart';
import 'package:bookingticket/utils/app_info_list.dart';
import 'package:bookingticket/utils/app_layout.dart';
import 'package:bookingticket/utils/app_styles.dart';
import 'package:bookingticket/widgets/column_layout.dart';
import 'package:bookingticket/widgets/layout_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  bool isFirstTabSelected = true;

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
            AppTicketTans(
              firstTab: "Upcoming",
              secondTab: "Previous",
              onTabChanged: (isSelected) {
                setState(() {
                  isFirstTabSelected = isSelected;
                });
                print(ticketList[1]);
              },
            ),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: isFirstTabSelected
                  ? TicketView(
                      ticket: ticketList[0],
                      isColor: true,
                    )
                  : TicketView(
                      ticket: ticketList[1],
                      isColor: true,
                    ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              margin: EdgeInsets.only(
                left: AppLayout.getHeight(15),
                right: AppLayout.getHeight(15),
              ),
              color: Colors.white,
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                Gap(AppLayout.getHeight(20)),
                const AppLayoutBuilderWidget(
                  sections: 15,
                  isColor: false,
                  width: 5,
                ),
                Gap(AppLayout.getHeight(20)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(
                      firstText: "0803 2001",
                      secondText: "Number if E-ticket",
                      alignment: CrossAxisAlignment.start,
                      isColor: true,
                    ),
                    AppColumnLayout(
                      firstText: "H258",
                      secondText: "Booking code",
                      alignment: CrossAxisAlignment.end,
                      isColor: true,
                    )
                  ],
                ),
                Gap(AppLayout.getHeight(20)),
                const AppLayoutBuilderWidget(
                  sections: 15,
                  isColor: false,
                  width: 5,
                ),
                Gap(AppLayout.getHeight(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/visa.png",
                              scale: 20,
                            ),
                            Text(
                              " *** 2424",
                              style: Styles.headLineStyle3,
                            )
                          ],
                        ),
                        Gap(5),
                        Text(
                          "Payment method",
                          style: Styles.headLineStyle4,
                        ),
                      ],
                    ),
                    AppColumnLayout(
                      firstText: "\$249.99",
                      secondText: "Price",
                      alignment: CrossAxisAlignment.end,
                      isColor: true,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: AppLayout.getHeight(15),
                  right: AppLayout.getHeight(15),
                  bottom: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(15),
                  bottom: AppLayout.getHeight(15)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                      bottomRight: Radius.circular(AppLayout.getHeight(21)))),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'https://github.com/nyattonguyen',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: isFirstTabSelected
                  ? TicketView(
                      ticket: ticketList[0],
                    )
                  : TicketView(
                      ticket: ticketList[1],
                    ),
            ),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
        Positioned(
            left: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                backgroundColor: Styles.textColor,
                maxRadius: 4,
              ),
            )),
        Positioned(
            right: AppLayout.getHeight(22),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                backgroundColor: Styles.textColor,
                maxRadius: 4,
              ),
            )),
      ]),
    );
  }
}
