import 'dart:async';
import 'dart:io' if (dart.library.io) 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';

class FakeErrorScreen extends StatefulWidget {
  const FakeErrorScreen({Key? key}) : super(key: key);

  @override
  State<FakeErrorScreen> createState() => _FakeErrorScreenState();
}

class _FakeErrorScreenState extends State<FakeErrorScreen>
    with TickerProviderStateMixin {
  bool _isLoading = true;
  bool _showError = false;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startPrankSequence();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
  }

  Future<void> _startPrankSequence() async {
    // Hide system UI for fullscreen immersion
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Wait for realistic loading delay
    await Future.delayed(const Duration(milliseconds: 2500));

    if (mounted) {
      setState(() {
        _isLoading = false;
        _showError = true;
      });

      // Trigger haptic feedback
      _triggerHapticFeedback();

      // Play error sound
      _playErrorSound();

      // Start error animations
      _fadeController.forward();
      _scaleController.forward();
    }
  }

  void _triggerHapticFeedback() {
    try {
      HapticFeedback.heavyImpact();
      // Additional vibration pattern for more realism
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) HapticFeedback.mediumImpact();
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) HapticFeedback.lightImpact();
      });
    } catch (e) {
      // Silent fail if haptic feedback not available
    }
  }

  void _playErrorSound() {
    try {
      SystemSound.play(SystemSoundType.alert);
    } catch (e) {
      // Silent fail if system sound not available
    }
  }

  void _handleRetryTap() {
    // Provide haptic feedback but don't actually do anything
    HapticFeedback.selectionClick();

    // Show brief loading state for realism
    setState(() {
      _isLoading = true;
      _showError = false;
    });

    // Reset animations
    _fadeController.reset();
    _scaleController.reset();

    // Show error again after brief delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _showError = true;
        });
        _triggerHapticFeedback();
        _fadeController.forward();
        _scaleController.forward();
      }
    });
  }

  void _handleExitTap() {
    HapticFeedback.selectionClick();

    // Restore system UI before exiting
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Exit the app
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    // Restore system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: _isLoading ? _buildLoadingState() : _buildErrorState(),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 8.w,
            height: 8.w,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            'Checking device compatibility...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: _buildErrorContent(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildErrorContent() {
    return Container(
      width: 100.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Error Icon
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              color: AppTheme.errorIOS.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomIconWidget(
                iconName: 'error',
                color: AppTheme.errorIOS,
                size: 10.w,
              ),
            ),
          ),

          SizedBox(height: 4.h),

          // Error Title
          Text(
            'Device Not Supported',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppTheme.errorIOS,
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 2.h),

          // Error Message
          Container(
            constraints: BoxConstraints(maxWidth: 80.w),
            child: Text(
              'This application requires a newer device model to function properly. Your current device does not meet the minimum hardware requirements.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 1.h),

          // Additional Error Details
          Container(
            constraints: BoxConstraints(maxWidth: 80.w),
            child: Text(
              'Error Code: DEVICE_COMPAT_001\nRequired: iOS 16.0+ / Android 12+',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withValues(alpha: 0.7),
                    fontFamily: 'monospace',
                  ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 6.h),

          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Retry Button
        SizedBox(
          width: 70.w,
          height: 6.h,
          child: ElevatedButton(
            onPressed: _handleRetryTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconWidget(
                  iconName: 'refresh',
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 5.w,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Retry',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 2.h),

        // Exit Button
        SizedBox(
          width: 70.w,
          height: 6.h,
          child: OutlinedButton(
            onPressed: _handleExitTap,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.errorIOS,
              side: BorderSide(
                color: AppTheme.errorIOS,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconWidget(
                  iconName: 'exit_to_app',
                  color: AppTheme.errorIOS,
                  size: 5.w,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Exit',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.errorIOS,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
