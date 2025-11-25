import 'package:flutter/material.dart';

class SpacezAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onBackPressed;

  const SpacezAppBar({super.key, this.onMenuPressed, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          'assets/logo/logo.png',
                          height: 26,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        child: Image.asset("assets/logo/img_1.png", height: 70),
                      ),
                    ],
                  ),
                  
                  IconButton(
                    onPressed: onMenuPressed,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black87,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),

                  const SizedBox(width: 6),

                  const Text(
                    "Coupons",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
