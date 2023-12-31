import 'package:bookingticket/screens/hotel_screen.dart';
import 'package:bookingticket/screens/ticket_view.dart';
import 'package:bookingticket/utils/app_info_list.dart';
import 'package:bookingticket/utils/app_styles.dart';
import 'package:bookingticket/widgets/double_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good moning",
                            style: Styles.headLineStyle3,
                          ),
                          const Gap(5),
                          Text(
                            "Book Tickets",
                            style: Styles.headLineStyle1,
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage("assets/images/img1.png"))),
                      )
                    ],
                  ),
                  const Gap(25),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4f6FD)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        const Icon(
                          FluentSystemIcons.ic_fluent_search_regular,
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                        Text(
                          "Search",
                          style: Styles.headLineStyle4,
                        )
                      ],
                    ),
                  ),
                  const Gap(40),
                  const AppDoubleTextWidget(
                      bigText: "Upcoming flights", smallText: "View all"),
                ],
              ),
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: ticketList
                      .map((ticketSingle) => TicketView(ticket: ticketSingle))
                      .toList()),
            ),
            const Gap(15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const AppDoubleTextWidget(
                  bigText: "Hotels", smallText: "View all"),
            ),
            const Gap(15),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: hotelList
                      .map((singleHotel) => HotelScreen(hotel: singleHotel))
                      .toList(),
                ))
          ],
        ));
  }
}
