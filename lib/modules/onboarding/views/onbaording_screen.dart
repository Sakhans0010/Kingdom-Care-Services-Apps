import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/constants/storage_keys.dart';
import 'package:kingdom_care_services_app/routes/routes.dart';
import 'package:kingdom_care_services_app/services/storage_services.dart';
import 'package:kingdom_care_services_app/widgets/custom_network_image.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnimation;

  final List<Map<String, String>> onboardingData = [
    {
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBXjvG42kkyCEkW1JsigiDruc-luU_XnMyzHr7WayT_E8tK9gmYmy3bUe5x5fzFDUvjAP1fQ3arTSPA2AjiVI4W1r1VFDhzf-zMOxvXFgEaw8nRcYWNO6GZ7tZnl_MMaBTEu9BVz4QG96tImOs4qio3CCZZTAx8ieOvfInZ3vcPsu6VRQQvavSa0ZUFOSxCxxgQzLLu_R7pm36dh9SPdaFoAdJ6--CH7Ev7SqyJWzmajYRVkO-oUD2lO0zYbZkzys1Zm0Iz1FEsTgcw",
      "title": "Welcome to Kingdom Care",
      "subtitle":
          "Connecting you with rewarding healthcare opportunities and simplifying your work life.",
    },
    {
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBXjvG42kkyCEkW1JsigiDruc-luU_XnMyzHr7WayT_E8tK9gmYmy3bUe5x5fzFDUvjAP1fQ3arTSPA2AjiVI4W1r1VFDhzf-zMOxvXFgEaw8nRcYWNO6GZ7tZnl_MMaBTEu9BVz4QG96tImOs4qio3CCZZTAx8ieOvfInZ3vcPsu6VRQQvavSa0ZUFOSxCxxgQzLLu_R7pm36dh9SPdaFoAdJ6--CH7Ev7SqyJWzmajYRVkO-oUD2lO0zYbZkzys1Zm0Iz1FEsTgcw",
      "title": "Track Your Shifts",
      "subtitle":
          "Easily manage upcoming shifts and stay updated in real-time.",
    },
    {
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBXjvG42kkyCEkW1JsigiDruc-luU_XnMyzHr7WayT_E8tK9gmYmy3bUe5x5fzFDUvjAP1fQ3arTSPA2AjiVI4W1r1VFDhzf-zMOxvXFgEaw8nRcYWNO6GZ7tZnl_MMaBTEu9BVz4QG96tImOs4qio3CCZZTAx8ieOvfInZ3vcPsu6VRQQvavSa0ZUFOSxCxxgQzLLu_R7pm36dh9SPdaFoAdJ6--CH7Ev7SqyJWzmajYRVkO-oUD2lO0zYbZkzys1Zm0Iz1FEsTgcw",
      "title": "Get Paid Fast",
      "subtitle":
          "Keep track of your earnings and receive payments promptly after your shifts.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _bounceAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).chain(CurveTween(curve: Curves.easeInOutBack)).animate(_bounceController);

    _pageController.addListener(() {
      if ((_pageController.page ?? 0).round() == onboardingData.length - 1) {
        _bounceController.forward();
      } else {
        _bounceController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    _markOnboardingSeen();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  void _markOnboardingSeen() async {
    final storage = SecureStorageService();
    await storage.write(key: StorageKeys.onboardingSeenKey, value: "true");
  }

  void _previous() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) => setState(() => _currentPage = value),
        itemBuilder: (context, index) {
          final data = onboardingData[index];

          // Calculate parallax offset
          double pageOffset = 0;
          if (_pageController.hasClients) {
            pageOffset =
                _pageController.page ?? _pageController.initialPage.toDouble();
          }
          final double offset = (index - pageOffset) * 0; // parallax intensity

          return Stack(
            children: [
              // Parallax image section
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.68,
                width: double.infinity,
                child: Transform.translate(
                  offset: Offset(offset, 0), // horizontal parallax
                  child: CustomNetworkImage(imageUrl: data["image"]!),
                ),
              ),
              // Bottom card
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(36),
                      topLeft: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .09),
                        blurRadius: 20,
                        spreadRadius: 8,
                        offset: const Offset(0, -16),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        data["title"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Google Sans',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        data["subtitle"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.neutral700,
                        ),
                      ),
                      const Spacer(),
                      // Spring dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onboardingData.length, (
                          dotIndex,
                        ) {
                          bool isActive = _currentPage == dotIndex;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutBack,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            height: isActive ? 14 : 10,
                            width: isActive ? 28 : 10,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryContainerColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 32),
                      _buildButtonsSection(context),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: Visibility(
                  visible: _currentPage != 0,
                  child: TextButton.icon(
                    onPressed: _previous,
                    icon: Icon(Icons.arrow_back_ios_new_sharp),
                    label: Text(
                      "Previous",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Column _buildButtonsSection(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: _currentPage == onboardingData.length - 1
              ? _bounceAnimation
              : const AlwaysStoppedAnimation(1.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _handleNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.secondaryBackground,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _currentPage < onboardingData.length - 1
                        ? "Next"
                        : "Get Started",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: _currentPage < onboardingData.length - 1 ? 16 : 72),
        if (_currentPage < onboardingData.length - 1)
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton(
              onPressed: _navigateToLogin,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                side: BorderSide(color: AppColors.neutral700),
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.neutral700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
