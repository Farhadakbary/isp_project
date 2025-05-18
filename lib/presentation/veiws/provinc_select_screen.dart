import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/province_entry.dart';
import '../view_models/user_view_model.dart';


class ProvinceSelectionScreen extends StatelessWidget {
  const ProvinceSelectionScreen({super.key});

  final List<String> _provinces = const [
    'Kabul',
    'Herat',
    'Balkh',
    'Nimruoz',
    'Ghazni',
    'Kandahar',
    'Farah',
    'Badghees',
    'Ghor',
    'Daykundi',
    'Bameyan',
    'Sar-e Pol',
    'Samangan',
    'Parwan',
    'Kapisa',
    'Logar',
    'Wardak',
    'Paktia',
    'Paktika',
    'Khost',
    'Nangarhar',
    'Kunar',
    'Laghman',
    'Kunduz',
    'Takhar',
    'Badakhshan',
    'Baghlan',
    'Jowzjan',
    'Faryab',
    'Helmand',
    'Zabul',
    'Urozgan',
    'Nuristan',
    'Panjshir',
  ];

  @override
  Widget build(BuildContext context) {
    final provinceVM = Provider.of<ProvinceViewModel>(context);
    final userVM = Provider.of<UserViewModel>(context, listen: false);

    if (provinceVM.selectedProvince == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        provinceVM.selectProvince('Herat');
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomPaint(
            painter: _WaveSkyBluePainter(),
            size: Size.infinite,
          ),
          Center(
            child: Container(
              width: 340,
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 16,
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
                  DropdownButtonFormField<String>(
                    value: provinceVM.selectedProvince ?? 'Herat',
                    decoration: InputDecoration(
                      labelText: "Choose your province",
                      labelStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    icon: const Icon(Icons.arrow_drop_down_rounded, color: Colors.black87),
                    iconSize: 28,
                    dropdownColor: Colors.white,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    items: _provinces
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                    onChanged: (String? newValue) {
                      provinceVM.selectProvince(newValue!);
                    },
                  ),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _WaveButton(
                        icon: Icons.arrow_forward,
                        isBlue: true,
                        label: "Next",
                        onPressed: () {
                          userVM.saveUser(
                            provinceVM.selectedProvince ?? 'Herat',
                            '',
                          );
                          Navigator.pushNamed(context, '/idEntry');
                        },
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

class _WaveSkyBluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBlue = Paint()..color = const Color(0xFF7EC8E3);

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

    canvas.drawPath(path, paintBlue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _WaveButton extends StatelessWidget {
  final IconData icon;
  final bool isBlue;
  final String label;
  final VoidCallback? onPressed;

  const _WaveButton({
    required this.icon,
    required this.isBlue,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: isBlue ? Colors.white : Colors.black,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: isBlue ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isBlue ? const Color(0xFF7EC8E3) : Colors.white,
        foregroundColor: isBlue ? Colors.white : Colors.black,
        elevation: 0,
        minimumSize: Size(110, 42),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isBlue
              ? BorderSide.none
              : const BorderSide(color: Colors.black, width: 1.2),
        ),
        textStyle: const TextStyle(fontSize: 15),
      ),
    );
  }
}