import 'package:flutter/material.dart';

import 'customAppbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpacezAppBar(),
      backgroundColor: Colors.grey[50],
      body: const CouponsScreen(),
    );
  }
}

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showBookingSummary = true;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double offset = _scrollController.offset;

      if (offset > lastOffset && _showBookingSummary) {
        setState(() => _showBookingSummary = false);
      }

      if (offset < lastOffset && !_showBookingSummary) {
        setState(() => _showBookingSummary = true);
      }

      lastOffset = offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CouponCard(
                discountAmount: "₹6,900",
                title: "LONGSTAY",
                description:
                    "15% off when you book for 5 days or more and 20% off when you book for 30 days or more.",
                onApply: () {},
              ),

              CouponCard(
                discountAmount: "₹6,900",
                title: "LONGSTAY",
                description:
                    "15% off when you book for 5 days or more and 20% off when you book for 30 days or more.",
                onApply: () {},
              ),

              Text(
                "Payment offers:",
                style: TextStyle(
                  fontSize: w * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: h * 0.015),

              CouponCard(
                discountAmount: "₹600",
                title: "LONGSTAY",
                description: "15% off when you book for 5 days or more",
                onApply: () {},
              ),
              CouponCard(
                discountAmount: "₹600",
                title: "LONGSTAY",
                description: "15% off when you book for 5 days or more",
                onApply: () {},
              ),

              SizedBox(height: h * 0.1),
            ],
          ),
        ),

        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: _showBookingSummary ? 0 : -150,
          left: 0,
          right: 0,
          child: _bookingSummary(context),
        ),
      ],
    );
  }

  Widget _bookingSummary(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 25,
            width: double.infinity,
            color: Colors.green.shade900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.discount, color: Colors.white, size: 22),
                Text(
                  "Book now & Unlock Exclusive Rewards",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "₹19,500",
                              style: TextStyle(
                                fontSize: w * 0.04,
                                color: Colors.red.shade900,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red,
                                decorationThickness: 2,
                              ),
                            ),
                            Text(
                              " ₹16,000",
                              style: TextStyle(
                                fontSize: w * 0.055,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 2),

                            Text("for 2 nights"),
                          ],
                        ),
                        Text(
                          "24 Apr - 26 Apr | 8 guests",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB6692F),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.07,
                          vertical: w * 0.025,
                        ),
                        shape: RoundedRectangleBorder(),
                      ),
                      child: Text(
                        "Reserve",
                        style: TextStyle(
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final String discountAmount;
  final String title;
  final String description;
  final VoidCallback onApply;

  const CouponCard({
    super.key,
    required this.discountAmount,
    required this.title,
    required this.description,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: w * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: w * 0.19,
                height: w * 0.40,
                decoration: BoxDecoration(color: const Color(0xFFB6692F)),
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      discountAmount,
                      style: TextStyle(
                        fontSize: w * 0.075,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: VerticalCutMarks(height: w * 0.40),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(w * 0.045),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: w * 0.048,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            color: const Color(0xFFB6692F),
                            size: w * 0.04,
                          ),
                          SizedBox(width: w * 0.01),
                          GestureDetector(
                            onTap: onApply,
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                fontSize: w * 0.042,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFB6692F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: w * 0.02),

                  Text(
                    description,
                    style: TextStyle(
                      fontSize: w * 0.036,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: w * 0.03),

                  Container(height: 1, color: Colors.grey.withOpacity(0.3)),

                  SizedBox(height: w * 0.02),

                  Text(
                    "Read more",
                    style: TextStyle(
                      fontSize: w * 0.038,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalCutMarks extends StatelessWidget {
  final double height;

  const VerticalCutMarks({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(10, height), painter: CutPainter());
  }
}

class CutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    double dashHeight = 12;
    double dashSpace = 12;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width, startY),
          width: 8,
          height: 5,
        ),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
