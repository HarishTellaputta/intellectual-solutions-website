import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IntellectualSolutionsApp());
}

class IntellectualSolutionsApp extends StatelessWidget {
  const IntellectualSolutionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intellectual Digital Solutions',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  void scrollTo(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _callUs() async {
    final uri = Uri.parse('tel:+919010737075');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse(
      'https://wa.me/919010737075?text=Hello%20Intellectual%20Digital%20Solutions,%20I%20need%20a%20software%20solution.',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> _sendEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'info@intellectualsolutions.in',
      queryParameters: {
        'subject': 'Software Development Enquiry',
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _navbar(context, isMobile),
            _heroSection(context, isMobile),
            _statsSection(context, isMobile),
            _servicesSection(context, isMobile),
            _deliverySection(context, isMobile),
            _productsSection(context, isMobile),
            _processSection(context, isMobile),
            _aboutSection(context, isMobile),
            _contactSection(context, isMobile),
            _footer(context),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // NAVBAR
  // ============================================================

  Widget _navbar(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        border: const Border(
          bottom: BorderSide(
            color: Color(0xFFE8EDF5),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
          vertical: 16,
        ),
        child: Row(
          children: [
            _brandLogo(),

            const Spacer(),

            if (!isMobile) ...[
              _navItem('Home', () => scrollTo(0)),
              _navItem('Services', () => scrollTo(850)),
              _navItem('Solutions', () => scrollTo(2600)),
              _navItem('About', () => scrollTo(4000)),
              const SizedBox(width: 18),
              _premiumButton(
                'Let’s Talk',
                _openWhatsApp,
                small: true,
              ),
            ] else
              IconButton(
                onPressed: () {
                  _showMobileMenu(context);
                },
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Color(0xFF0F172A),
                  size: 28,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _brandLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2563EB),
                Color(0xFF4F46E5),
                Color(0xFF7C3AED),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2563EB).withOpacity(0.25),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'IS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'INTELLECTUAL',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(height: 1),
            const Text(
              'DIGITAL SOLUTIONS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.7,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Our Solutions Make You Grow',
              style: TextStyle(
                fontSize: 9,
                color: Colors.grey.shade600,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF334155),
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 10,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              25,
              25,
              25,
              30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 25),
                _mobileMenuItem(
                  sheetContext,
                  'Home',
                  0,
                  Icons.home_outlined,
                ),
                _mobileMenuItem(
                  sheetContext,
                  'Services',
                  850,
                  Icons.auto_awesome_outlined,
                ),
                _mobileMenuItem(
                  sheetContext,
                  'Solutions',
                  2600,
                  Icons.apps_outlined,
                ),
                _mobileMenuItem(
                  sheetContext,
                  'About',
                  4000,
                  Icons.business_outlined,
                ),
                _mobileMenuItem(
                  sheetContext,
                  'Contact',
                  4700,
                  Icons.chat_outlined,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(
    BuildContext sheetContext,
    String title,
    double position,
    IconData icon,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 3,
      ),
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFEFF6FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF2563EB),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F172A),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 15,
      ),
      onTap: () {
        Navigator.pop(sheetContext);
        scrollTo(position);
      },
    );
  }

  // ============================================================
  // HERO
  // ============================================================

  Widget _heroSection(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 70,
        vertical: isMobile ? 70 : 105,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFF),
            Color(0xFFEEF4FF),
            Color(0xFFF8F7FF),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: _blurCircle(
              300,
              const Color(0xFF60A5FA),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -100,
            child: _blurCircle(
              300,
              const Color(0xFFA78BFA),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1250,
              ),
              child: isMobile
                  ? Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _heroText(context, isMobile),
                        const SizedBox(height: 55),
                        _heroVisual(isMobile),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: _heroText(
                            context,
                            isMobile,
                          ),
                        ),
                        const SizedBox(width: 70),
                        Expanded(
                          flex: 5,
                          child: _heroVisual(isMobile),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _blurCircle(
    double size,
    Color color,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.08),
      ),
    );
  }

  Widget _heroText(
    BuildContext context,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFE0ECFF),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color(0xFFBFDBFE),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome,
                size: 15,
                color: Color(0xFF2563EB),
              ),
              SizedBox(width: 8),
              Text(
                'DIGITAL SOLUTIONS FOR GROWING BUSINESSES',
                style: TextStyle(
                  color: Color(0xFF1D4ED8),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        Text(
          'Technology that\nmoves your business\nforward.',
          style: TextStyle(
            fontSize: isMobile ? 43 : 61,
            height: 1.08,
            fontWeight: FontWeight.w900,
            letterSpacing: -2,
            color: const Color(0xFF0F172A),
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'We build modern websites, mobile applications '
          'and digital platforms that help businesses '
          'operate smarter, connect better and grow faster.',
          style: TextStyle(
            fontSize: 17,
            height: 1.75,
            color: Color(0xFF64748B),
          ),
        ),

        const SizedBox(height: 35),

        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            _premiumButton(
              'Start a Project',
              _openWhatsApp,
            ),
            OutlinedButton(
              onPressed: () => scrollTo(850),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF0F172A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 17,
                ),
                side: const BorderSide(
                  color: Color(0xFFCBD5E1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: const Text(
                'Explore Services',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 38),

        Wrap(
          spacing: 25,
          runSpacing: 15,
          children: [
            _heroTrust(
              Icons.verified_outlined,
              'Business-focused',
            ),
            _heroTrust(
              Icons.devices_outlined,
              'Web & Mobile',
            ),
            _heroTrust(
              Icons.support_agent_outlined,
              'Direct Support',
            ),
          ],
        ),
      ],
    );
  }

  Widget _heroTrust(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: Color(0xFF2563EB),
          size: 18,
        ),
        const SizedBox(width: 7),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF475569),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _heroVisual(bool isMobile) {
    return Container(
      height: isMobile ? 400 : 475,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF172554),
            Color(0xFF312E81),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF312E81)
                .withOpacity(0.25),
            blurRadius: 60,
            offset: const Offset(0, 25),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),

          Positioned(
            bottom: -80,
            left: -70,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF60A5FA)
                    .withOpacity(0.08),
              ),
            ),
          ),

          Center(
            child: Container(
              width: isMobile ? 155 : 180,
              height: isMobile ? 155 : 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.06),
                border: Border.all(
                  color: Colors.white.withOpacity(0.12),
                  width: 1.5,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3B82F6),
                      Color(0xFF7C3AED),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3B82F6)
                          .withOpacity(0.4),
                      blurRadius: 35,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.code_rounded,
                  color: Colors.white,
                  size: 55,
                ),
              ),
            ),
          ),

          Positioned(
            top: 30,
            left: 30,
            child: _floatingCard(
              Icons.phone_android_rounded,
              'Mobile Apps',
            ),
          ),

          Positioned(
            top: 145,
            right: 25,
            child: _floatingCard(
              Icons.language_rounded,
              'Web Solutions',
            ),
          ),

          Positioned(
            bottom: 32,
            left: 30,
            child: _floatingCard(
              Icons.analytics_outlined,
              'Business Systems',
            ),
          ),

          Positioned(
            bottom: 32,
            right: 25,
            child: _floatingCard(
              Icons.cloud_outlined,
              'Digital Growth',
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingCard(
    IconData icon,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.09),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withOpacity(0.13),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: const Color(0xFF93C5FD),
            size: 20,
          ),
          const SizedBox(width: 9),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATS
  // ============================================================

  Widget _statsSection(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: isMobile ? 45 : 55,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1050,
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 50,
            runSpacing: 35,
            children: [
              _stat('01', 'Business-first', 'Solutions'),
              _stat('02', 'Web & Mobile', 'Development'),
              _stat('03', 'Custom', 'Technology'),
              _stat('04', 'Direct', 'Support'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stat(
    String number,
    String title,
    String subtitle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Color(0xFF2563EB),
          ),
        ),
        const SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // SERVICES
  // ============================================================

  Widget _servicesSection(
    BuildContext context,
    bool isMobile,
  ) {
    return _section(
      background: const Color(0xFFF8FAFC),
      child: Column(
        children: [
          _sectionHeading(
            'What We Build',
            'Practical digital solutions designed around your business.',
          ),
          const SizedBox(height: 55),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _serviceCard(
                Icons.language_rounded,
                'Website Development',
                'Premium, responsive websites that create a strong digital presence.',
              ),
              _serviceCard(
                Icons.phone_android_rounded,
                'Mobile Applications',
                'Modern Flutter applications for Android and iOS.',
              ),
              _serviceCard(
                Icons.restaurant_rounded,
                'Restaurant Solutions',
                'Digital ordering and restaurant management solutions.',
              ),
              _serviceCard(
                Icons.local_shipping_rounded,
                'Delivery Platforms',
                'Centralized delivery operations and partner management.',
              ),
              _serviceCard(
                Icons.settings_suggest_rounded,
                'Custom Software',
                'Software designed around your unique business workflow.',
              ),
              _serviceCard(
                Icons.auto_awesome_rounded,
                'Business Automation',
                'Connect processes and reduce repetitive manual work.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(
    IconData icon,
    String title,
    String description,
  ) {
    return _HoverCard(
      width: 350,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.035),
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE0ECFF),
                    Color(0xFFF0EFFF),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF2563EB),
                size: 27,
              ),
            ),
            const SizedBox(height: 23),
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 11),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                height: 1.65,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 7),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: Color(0xFF2563EB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DELIVERY
  // ============================================================

  Widget _deliverySection(
    BuildContext context,
    bool isMobile,
  ) {
    return _section(
      background: Colors.white,
      child: isMobile
          ? Column(
              children: [
                _deliveryText(),
                const SizedBox(height: 45),
                _deliveryDiagram(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _deliveryText()),
                const SizedBox(width: 75),
                Expanded(child: _deliveryDiagram()),
              ],
            ),
    );
  }

  Widget _deliveryText() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        _eyebrow('OUR PLATFORM SOLUTION'),
        const SizedBox(height: 18),
        const Text(
          'Connect orders to\ndelivery operations.',
          style: TextStyle(
            fontSize: 42,
            height: 1.12,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Restaurants can send delivery requests to a centralized '
          'platform. Manage assignments, pickup and delivery status '
          'from one connected system.',
          style: TextStyle(
            fontSize: 16,
            height: 1.75,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 25),
        _bullet('Centralized delivery requests'),
        _bullet('Delivery partner assignment'),
        _bullet('Pickup and delivery status'),
        _bullet('Operational visibility'),
      ],
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF2563EB),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF334155),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _deliveryDiagram() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFF),
            Color(0xFFF1F5FF),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        children: [
          _flowBox(
            Icons.restaurant_rounded,
            'Restaurant',
            'Create delivery request',
          ),
          const Icon(
            Icons.arrow_downward_rounded,
            color: Color(0xFF94A3B8),
          ),
          _flowBox(
            Icons.hub_rounded,
            'Delivery Platform',
            'Assign & manage',
          ),
          const Icon(
            Icons.arrow_downward_rounded,
            color: Color(0xFF94A3B8),
          ),
          _flowBox(
            Icons.delivery_dining_rounded,
            'Delivery Partner',
            'Pickup & deliver',
          ),
        ],
      ),
    );
  }

  Widget _flowBox(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2563EB),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PRODUCTS
  // ============================================================

  Widget _productsSection(
    BuildContext context,
    bool isMobile,
  ) {
    return _section(
      background: const Color(0xFF0B1120),
      child: Column(
        children: [
          const Text(
            'OUR PRODUCTS',
            style: TextStyle(
              color: Color(0xFF60A5FA),
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Digital products built\nfor real businesses.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              height: 1.15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Purpose-built platforms designed to solve operational problems.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 55),
          Wrap(
            spacing: 22,
            runSpacing: 22,
            alignment: WrapAlignment.center,
            children: [
              _productCard(
                'REST_IN',
                'Restaurant Management',
                Icons.restaurant_menu_rounded,
                [
                  'Order management',
                  'Restaurant operations',
                  'Menu management',
                  'Customer ordering',
                ],
              ),
              _productCard(
                'DELIVERY',
                'Delivery Management',
                Icons.delivery_dining_rounded,
                [
                  'Delivery requests',
                  'Partner assignment',
                  'Pickup tracking',
                  'Delivery status',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productCard(
    String label,
    String title,
    IconData icon,
    List<String> features,
  ) {
    return _HoverCard(
      width: 520,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF172033),
              Color(0xFF111827),
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 35,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2563EB),
                        Color(0xFF7C3AED),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xFF93C5FD),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 22),
            ...features.map(
              (feature) => Padding(
                padding:
                    const EdgeInsets.only(bottom: 13),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFF60A5FA),
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PROCESS
  // ============================================================

  Widget _processSection(
    BuildContext context,
    bool isMobile,
  ) {
    return _section(
      background: const Color(0xFFF8FAFC),
      child: Column(
        children: [
          _sectionHeading(
            'How We Work',
            'A simple process from idea to launch.',
          ),
          const SizedBox(height: 55),
          Wrap(
            spacing: 25,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _processCard(
                '01',
                Icons.lightbulb_outline_rounded,
                'Understand',
                'We understand your business, goals and requirements.',
              ),
              _processCard(
                '02',
                Icons.design_services_outlined,
                'Design',
                'We create a clear and premium digital experience.',
              ),
              _processCard(
                '03',
                Icons.code_rounded,
                'Build',
                'We develop reliable web and mobile solutions.',
              ),
              _processCard(
                '04',
                Icons.rocket_launch_outlined,
                'Launch',
                'We help you take the solution live and move forward.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _processCard(
    String number,
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                number,
                style: const TextStyle(
                  color: Color(0xFFCBD5E1),
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(),
              Icon(
                icon,
                color: const Color(0xFF2563EB),
                size: 25,
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              height: 1.6,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ABOUT
  // ============================================================

  Widget _aboutSection(
    BuildContext context,
    bool isMobile,
  ) {
    return _section(
      background: Colors.white,
      child: isMobile
          ? Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                _aboutText(),
                const SizedBox(height: 40),
                _technologyBox(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _aboutText()),
                const SizedBox(width: 80),
                Expanded(child: _technologyBox()),
              ],
            ),
    );
  }

  Widget _aboutText() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        _eyebrow('ABOUT US'),
        const SizedBox(height: 18),
        const Text(
          'Simple technology.\nPractical solutions.',
          style: TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Intellectual Digital Solutions focuses on building '
          'practical software products that help businesses '
          'move from manual processes to connected digital operations.',
          style: TextStyle(
            fontSize: 16,
            height: 1.75,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 25),
        _bullet('Business-focused approach'),
        _bullet('Modern technology'),
        _bullet('Simple user experience'),
        _bullet('Long-term digital growth'),
      ],
    );
  }

  Widget _technologyBox() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFF),
            Color(0xFFF4F1FF),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Technology We Work With',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Modern tools for scalable solutions.',
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 25),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _tech('Flutter'),
              _tech('Java'),
              _tech('Spring Boot'),
              _tech('MySQL'),
              _tech('REST APIs'),
              _tech('Angular'),
              _tech('Cloud'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tech(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: Color(0xFF334155),
        ),
      ),
    );
  }

  // ============================================================
  // CONTACT
  // ============================================================

  Widget _contactSection(
    BuildContext context,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: isMobile ? 75 : 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF172554),
            Color(0xFF312E81),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: Column(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
                child: const Icon(
                  Icons.rocket_launch_rounded,
                  color: Color(0xFF93C5FD),
                  size: 29,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Have an idea?\nLet’s build it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  height: 1.12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Tell us what you need and let’s explore the right '
                'digital solution for your business.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 38),
              Wrap(
                spacing: 14,
                runSpacing: 14,
                alignment: WrapAlignment.center,
                children: [
                  _contactButton(
                    Icons.chat_rounded,
                    'WhatsApp',
                    _openWhatsApp,
                  ),
                  _contactButton(
                    Icons.phone_rounded,
                    'Call Us',
                    _callUs,
                  ),
                  _contactButton(
                    Icons.email_rounded,
                    'Email',
                    _sendEmail,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactButton(
    IconData icon,
    String title,
    VoidCallback onPressed,
  ) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(title),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
            Colors.white.withOpacity(0.04),
        side: BorderSide(
          color: Colors.white.withOpacity(0.18),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF020617),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Column(
        children: [
          const Text(
            'INTELLECTUAL DIGITAL SOLUTIONS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Our Solutions Make You Grow',
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white.withOpacity(0.06),
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2026 Intellectual Digital Solutions. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF475569),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COMMON
  // ============================================================

  Widget _section({
    required Color background,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _sectionHeading(
    String title,
    String subtitle,
  ) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 13),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _eyebrow(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF2563EB),
        fontSize: 12,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.7,
      ),
    );
  }

  Widget _premiumButton(
    String text,
    VoidCallback onPressed, {
    bool small = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: small ? 20 : 26,
          vertical: small ? 13 : 17,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            small ? 10 : 13,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 13,
        ),
      ),
    );
  }
}

// ============================================================
// HOVER CARD
// ============================================================

class _HoverCard extends StatefulWidget {
  final Widget child;
  final double width;

  const _HoverCard({
    required this.child,
    required this.width,
  });

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: widget.width,
        transform: Matrix4.translationValues(
          0,
          hovered ? -6 : 0,
          0,
        ),
        child: widget.child,
      ),
    );
  }
}