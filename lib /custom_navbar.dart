library custom_navbar;

import 'package:flutter/material.dart';

class FloatingNavBar extends StatefulWidget {
  final int initialIndex;

  final List<Icon> icons;

  /// Callback function when an icon is tapped
  final ValueChanged<int> onTap;

  /// Height of the navbar container
  final double navBarHeight;

  /// Width and height of each icon container
  final double iconBoxSize;

  /// Viewport fraction for PageView
  final double viewportFraction;

  /// Animation duration for all animations
  final Duration animationDuration;

  /// Scale factor for selected icon
  final double selectedScale;

  /// Scale factor for unselected icons
  final double unselectedScale;

  /// Background color of selected icon
  final Color selectedBackgroundColor;

  /// Background color of unselected icons
  final Color unselectedBackgroundColor;

  /// Color of selected icon
  final Color selectedIconColor;

  /// Color of unselected icons
  final Color unselectedIconColor;

  /// Size of selected icon
  final double selectedIconSize;

  /// Size of unselected icons
  final double unselectedIconSize;

  /// Shadow color for selected icon
  final Color shadowColor;

  /// Shadow offset
  final Offset shadowOffset;

  /// Shadow blur radius
  final double shadowBlurRadius;

  /// Shadow spread radius
  final double shadowSpreadRadius;

  /// Curve for all animations
  final Curve animationCurve;

  const FloatingNavBar({
    super.key,
    required this.initialIndex,
    required this.icons,
    required this.onTap,
    this.navBarHeight = 90,
    this.iconBoxSize = 60,
    this.viewportFraction = 0.22,
    this.animationDuration = const Duration(milliseconds: 300),
    this.selectedScale = 0.7,
    this.unselectedScale = 0.5,
    this.selectedBackgroundColor = Colors.white,
    this.unselectedBackgroundColor = Colors.grey,
    this.selectedIconColor = Colors.purple,
    this.unselectedIconColor = Colors.white,
    this.selectedIconSize = 40,
    this.unselectedIconSize = 25,
    this.shadowColor = Colors.black,
    this.shadowOffset = const Offset(0, 2),
    this.shadowBlurRadius = 20,
    this.shadowSpreadRadius = 6,
    this.animationCurve = Curves.easeInOut,
  });

  @override
  FloatingNavBarState createState() => FloatingNavBarState();
}

class FloatingNavBarState extends State<FloatingNavBar> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: widget.navBarHeight,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.icons.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
            widget.onTap(index);
          },
          itemBuilder: (context, index) {
            final bool isSelected = _currentIndex == index;
            final double scale = isSelected 
                ? widget.selectedScale 
                : widget.unselectedScale;

            return TweenAnimationBuilder(
              tween: Tween<double>(begin: scale, end: scale),
              duration: widget.animationDuration,
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: widget.animationDuration,
                        curve: widget.animationCurve,
                      );
                      setState(() {
                        _currentIndex = index;
                      });
                      widget.onTap(index);
                    },
                    child: Container(
                      width: widget.iconBoxSize,
                      height: widget.iconBoxSize,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? widget.selectedBackgroundColor
                            : widget.unselectedBackgroundColor,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: widget.shadowColor.withAlpha(128),
                                  offset: widget.shadowOffset,
                                  blurRadius: widget.shadowBlurRadius,
                                  spreadRadius: widget.shadowSpreadRadius,
                                ),
                              ]
                            : [],
                      ),
                      child: Center(
                        child: Icon(
                        widget.icons[index].icon,
                        color: widget.icons[index].color ?? 
                              (isSelected ? widget.selectedIconColor : widget.unselectedIconColor),
                        size: widget.icons[index].size ?? 
                              (isSelected ? widget.selectedIconSize : widget.unselectedIconSize),
                      ),

                        
                         
                     
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}