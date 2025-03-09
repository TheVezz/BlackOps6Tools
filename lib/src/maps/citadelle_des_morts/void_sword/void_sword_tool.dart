import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'void_sword_svg.dart';

class VoidSwordTool extends StatefulWidget {
  const VoidSwordTool({super.key});

  @override
  State<VoidSwordTool> createState() => _VoidSwordToolState();
}

class _VoidSwordToolState extends State<VoidSwordTool>
    with TickerProviderStateMixin {
  //Notifier to manage rotations
  final ValueNotifier<double> outerRotationNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<double> innerRotationNotifier = ValueNotifier<double>(0.0);

  String? selectedAsset;

  late final AnimationController _outerController;
  late final AnimationController _innerController;
  late Animation<double> _outerAnimation;
  late Animation<double> _innerAnimation;

  @override
  void initState() {
    super.initState();
    _outerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _innerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    //We initialize animations with initial values ​​equal to notifier
    _outerAnimation = Tween<double>(
      begin: outerRotationNotifier.value,
      end: outerRotationNotifier.value,
    ).animate(
      CurvedAnimation(parent: _outerController, curve: Curves.easeInOut),
    );
    _innerAnimation = Tween<double>(
      begin: innerRotationNotifier.value,
      end: innerRotationNotifier.value,
    ).animate(
      CurvedAnimation(parent: _innerController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _outerController.dispose();
    _innerController.dispose();
    outerRotationNotifier.dispose();
    innerRotationNotifier.dispose();
    super.dispose();
  }

  ///Start the animation and update the valuanotifier.
  void _animateRotation(double newOuter, double newInner) {
    _outerAnimation = Tween<double>(
      begin: outerRotationNotifier.value,
      end: newOuter,
    ).animate(
      CurvedAnimation(parent: _outerController, curve: Curves.easeInOut),
    );
    _innerAnimation = Tween<double>(
      begin: innerRotationNotifier.value,
      end: newInner,
    ).animate(
      CurvedAnimation(parent: _innerController, curve: Curves.easeInOut),
    );

    //add the listeners to update the notifier
    _outerAnimation.addListener(() {
      outerRotationNotifier.value = _outerAnimation.value;
    });
    _innerAnimation.addListener(() {
      innerRotationNotifier.value = _innerAnimation.value;
    });

    _outerController
      ..reset()
      ..forward();
    _innerController
      ..reset()
      ..forward();
  }

  ///generates the svg by replacing the placeholders with current values.
  String _generateSvg(double outer, double inner) {
    return voidSwordSvgTemplate
        .replaceAll('{outerRotation}', outer.toString())
        .replaceAll('{innerRotation}', inner.toString());
  }

  ///builds a button to select an asset and start animation.
  Widget _buildAssetButton(String assetPath, double outerTarget, double innerTarget) {
    return ElevatedButton(
      onPressed: () {
        _animateRotation(outerTarget, innerTarget);
        setState(() {
          selectedAsset = assetPath;
        });
      },
      child: Image.asset(
        assetPath,
        width: 40,
        height: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //USA VALUELISTABLEBUilder to reconstruct the SVG when rotations change.
        ValueListenableBuilder<double>(
          valueListenable: outerRotationNotifier,
          builder: (context, outerRotation, _) {
            return ValueListenableBuilder<double>(
              valueListenable: innerRotationNotifier,
              builder: (context, innerRotation, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.string(
                      _generateSvg(outerRotation, innerRotation),
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    if (selectedAsset != null)
                      Image.asset(
                        selectedAsset!,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                  ],
                );
              },
            );
          },
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildAssetButton(
              'assets/images/maps/citadelle_des_morts/void_sword/jaw.webp',
              -113.0,
              -90.0,
            ),
            _buildAssetButton(
              'assets/images/maps/citadelle_des_morts/void_sword/horn.webp',
              -135.0,
              -90.0,
            ),
            _buildAssetButton(
              'assets/images/maps/citadelle_des_morts/void_sword/gemini.webp',
              -45.0,
              -270.0,
            ),
            _buildAssetButton(
              'assets/images/maps/citadelle_des_morts/void_sword/fish.webp',
              -270.0,
              -180.0,
            ),
            _buildAssetButton(
              'assets/images/maps/citadelle_des_morts/void_sword/scorpion.webp',
              -293.0,
              -180.0,
            ),
          ],
        ),
      ],
    );
  }
}
