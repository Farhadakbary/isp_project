import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/id_entry.dart';
import '../view_models/user_view_model.dart';


class IDEntryScreen extends StatelessWidget {
  const IDEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final idVM = Provider.of<IDEntryViewModel>(context);
    final userVM = Provider.of<UserViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          CustomPaint(
            painter: _WaveBlackPainter(),
            size: Size.infinite,
          ),

          Center(
            child: Container(
              width: 340,
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.91),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 14,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      "Heray Rafa",
                      style: TextStyle(
                        fontFamily: "Georgia",
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) => idVM.setUserId(value),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your ID',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                        size: 26,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _WaveButton(
                        icon: Icons.arrow_back,
                        isBlack: false,
                        label: "Previous",
                        onPressed: () => Navigator.pop(context),
                      ),
                      _WaveButton(
                        icon: Icons.arrow_forward,
                        isBlack: true,
                        label: "Next",
                        onPressed: idVM.userId.isNotEmpty
                            ? () {
                          userVM.saveUser(
                            userVM.currentUser!.province,
                            idVM.userId,
                          );
                          Navigator.pushReplacementNamed(
                              context, '/dashboard');
                        }
                            : null,
                      ),
                    ],
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

class _WaveBlackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBlack = Paint()..color = Colors.black;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * 0.65, 0)
      ..quadraticBezierTo(
        size.width * 0.85, size.height * 0.18,
        size.width * 0.70, size.height * 0.30,
      )
      ..quadraticBezierTo(
        size.width * 0.60, size.height * 0.38,
        size.width * 0.75, size.height * 0.50,
      )
      ..quadraticBezierTo(
        size.width * 0.95, size.height * 0.65,
        size.width * 0.73, size.height * 0.82,
      )
      ..quadraticBezierTo(
          size.width * 0.55, size.height * 0.97,
          size.width, size.height
      )
      ..close();

    canvas.drawPath(path, paintBlack);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _WaveButton extends StatelessWidget {
  final IconData icon;
  final bool isBlack;
  final String label;
  final VoidCallback? onPressed;

  const _WaveButton({
    required this.icon,
    required this.isBlack,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: isBlack ? Colors.white : Colors.black,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: isBlack ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isBlack ? Colors.black : Colors.white,
        foregroundColor: isBlack ? Colors.white : Colors.black,
        elevation: 0,
        minimumSize: Size(110, 42),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isBlack
              ? BorderSide.none
              : const BorderSide(color: Colors.black, width: 1.2),
        ),
        textStyle: const TextStyle(fontSize: 15),
      ),
    );
  }
}