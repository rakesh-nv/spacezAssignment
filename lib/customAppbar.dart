import 'package:flutter/material.dart';

class SpacezAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onBackPressed;

  const SpacezAppBar({
    super.key,
    this.onMenuPressed,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // TOP ROW – Logo + Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Image.asset(
                    'assets/logo/logo.png',
                    height: 26,
                    fit: BoxFit.contain,
                  ),

                  // Menu Icon
                  IconButton(
                    onPressed: onMenuPressed,
                    icon: const Icon(Icons.menu, color: Colors.black87, size: 28),
                  ),
                ],
              ),
            ),

            // BOTTOM ROW – Back + Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onBackPressed ?? () => Navigator.pop(context),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 20,
                    ),
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
