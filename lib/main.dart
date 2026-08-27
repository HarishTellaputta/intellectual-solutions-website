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
      title: 'Intellectual Solutions',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
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
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _callUs() async {
    final Uri phoneUri = Uri.parse('tel:+919010737075');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _openWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/919010737075?text=Hello%20Intellectual%20Solutions,%20I%20need%20a%20software%20solution.',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'info@intellectualsolutions.in',
      queryParameters: {'subject': 'Software Development Enquiry'},
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _navbar(context, isMobile),
            _heroSection(context, isMobile),
            _servicesSection(context, isMobile),
            _deliverySection(context, isMobile),
            _productsSection(context, isMobile),
            _aboutSection(context, isMobile),
            _contactSection(context, isMobile),
            _footer(context),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // NAVBAR
  // ----------------------------------------------------------

  Widget _navbar(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 70,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.96),
        border: const Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: [
          // LOGO
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF4F46E5)],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'IS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Intellectual Solutions',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),

          const Spacer(),

          if (!isMobile) ...[
            _navItem('Home', () => scrollTo(0)),
            _navItem('Services', () => scrollTo(700)),
            _navItem('Products', () => scrollTo(2100)),
            _navItem('About', () => scrollTo(2850)),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () => scrollTo(3500),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Contact Us'),
            ),
          ] else
            IconButton(
              onPressed: () {
                _showMobileMenu(context);
              },
              icon: const Icon(Icons.menu),
            ),
        ],
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF374151),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _mobileMenuItem('Home', 0),
                _mobileMenuItem('Services', 700),
                _mobileMenuItem('Products', 2100),
                _mobileMenuItem('About', 2850),
                _mobileMenuItem('Contact', 3500),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(String title, double position) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pop(context);
        scrollTo(position);
      },
    );
  }

  // ----------------------------------------------------------
  // HERO
  // ----------------------------------------------------------

  Widget _heroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25 : 80,
        vertical: isMobile ? 70 : 110,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8FAFC), Color(0xFFEFF6FF)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _heroText(),
                    const SizedBox(height: 50),
                    _heroVisual(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 6, child: _heroText()),
                    const SizedBox(width: 70),
                    Expanded(flex: 5, child: _heroVisual()),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _heroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFDBEAFE),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'SOFTWARE • APPS • DIGITAL SOLUTIONS',
            style: TextStyle(
              color: Color(0xFF1D4ED8),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Technology that\nmoves your business forward.',
          style: TextStyle(
            fontSize: 52,
            height: 1.12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Intellectual Solutions builds modern websites, '
          'mobile applications and business platforms designed '
          'to simplify operations and improve digital experiences.',
          style: TextStyle(fontSize: 18, height: 1.7, color: Color(0xFF64748B)),
        ),
        const SizedBox(height: 35),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Contact action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Explore Solutions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 15),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF1E293B),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                side: const BorderSide(color: Color(0xFFCBD5E1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('View Services'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _heroVisual() {
    return Container(
      height: 430,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E3A8A), Color(0xFF312E81)],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            offset: const Offset(0, 25),
            color: Colors.blue.withOpacity(0.15),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            right: 50,
            child: _floatingCard(Icons.phone_android, 'Mobile Apps'),
          ),
          Positioned(
            top: 160,
            left: 45,
            child: _floatingCard(Icons.language, 'Web Solutions'),
          ),
          Positioned(
            bottom: 50,
            right: 80,
            child: _floatingCard(
              Icons.local_shipping_outlined,
              'Delivery Platform',
            ),
          ),
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.12),
              ),
              child: const Icon(Icons.code, color: Colors.white, size: 70),
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingCard(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // SERVICES
  // ----------------------------------------------------------

  Widget _servicesSection(BuildContext context, bool isMobile) {
    return _section(
      background: Colors.white,
      child: Column(
        children: [
          _sectionHeading(
            'Our Services',
            'Digital solutions built around your business needs.',
          ),
          const SizedBox(height: 55),
          Wrap(
            spacing: 22,
            runSpacing: 22,
            alignment: WrapAlignment.center,
            children: [
              _serviceCard(
                Icons.web,
                'Website Development',
                'Fast, responsive and modern websites for businesses and brands.',
              ),
              _serviceCard(
                Icons.phone_android,
                'Mobile App Development',
                'Flutter-based Android and iOS applications with modern UX.',
              ),
              _serviceCard(
                Icons.restaurant,
                'Restaurant Solutions',
                'Digital ordering, restaurant management and operational tools.',
              ),
              _serviceCard(
                Icons.local_shipping,
                'Delivery Management',
                'A centralized platform to manage delivery requests and partners.',
              ),
              _serviceCard(
                Icons.settings_suggest,
                'Custom Software',
                'Business-specific software designed around your workflow.',
              ),
              _serviceCard(
                Icons.auto_awesome,
                'Business Automation',
                'Reduce manual work with connected digital processes.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(IconData icon, String title, String description) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF2563EB), size: 27),
          ),
          const SizedBox(height: 22),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // DELIVERY PLATFORM
  // ----------------------------------------------------------

  Widget _deliverySection(BuildContext context, bool isMobile) {
    return _section(
      background: const Color(0xFFF8FAFC),
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
                const SizedBox(width: 80),
                Expanded(child: _deliveryDiagram()),
              ],
            ),
    );
  }

  Widget _deliveryText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DELIVERY MANAGEMENT PLATFORM',
          style: TextStyle(
            color: Color(0xFF2563EB),
            fontWeight: FontWeight.bold,
            fontSize: 13,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Connect orders to\ndelivery operations.',
          style: TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Restaurants can send delivery requests to a centralized '
          'delivery platform. Manage assignments, pickup, tracking '
          'and delivery status from one system.',
          style: TextStyle(fontSize: 17, height: 1.7, color: Color(0xFF64748B)),
        ),
        const SizedBox(height: 25),
        _bullet('Centralized delivery requests'),
        _bullet('Delivery partner assignment'),
        _bullet('Pickup and delivery status'),
        _bullet('Real-time operational visibility'),
      ],
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF2563EB), size: 21),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF334155),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _deliveryDiagram() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          _flowBox(Icons.restaurant, 'Restaurant', 'Delivery Request'),
          const Icon(Icons.arrow_downward, color: Color(0xFF94A3B8)),
          _flowBox(Icons.hub, 'Delivery Platform', 'Assign & Manage'),
          const Icon(Icons.arrow_downward, color: Color(0xFF94A3B8)),
          _flowBox(
            Icons.delivery_dining,
            'Delivery Partner',
            'Pickup & Deliver',
          ),
        ],
      ),
    );
  }

  Widget _flowBox(IconData icon, String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF2563EB)),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // PRODUCTS
  // ----------------------------------------------------------

  Widget _productsSection(BuildContext context, bool isMobile) {
    return _section(
      background: Colors.white,
      child: Column(
        children: [
          _sectionHeading(
            'Our Solutions',
            'Purpose-built digital products for modern operations.',
          ),
          const SizedBox(height: 55),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children:
                [
                  _productCard(
                    'REST_IN',
                    'Restaurant Management Platform',
                    Icons.restaurant_menu,
                    [
                      'Order management',
                      'Table management',
                      'Kitchen operations',
                      'Pre-order support',
                    ],
                  ),
                  _productCard(
                    'DELIVERY',
                    'Delivery Management Platform',
                    Icons.delivery_dining,
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
    return Container(
      width: 520,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const Spacer(),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF93C5FD),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 22),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Color(0xFF60A5FA), size: 20),
                  const SizedBox(width: 10),
                  Text(
                    feature,
                    style: const TextStyle(
                      color: Color(0xFFCBD5E1),
                      fontSize: 15,
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

  // ----------------------------------------------------------
  // ABOUT
  // ----------------------------------------------------------

  Widget _aboutSection(BuildContext context, bool isMobile) {
    return _section(
      background: const Color(0xFFF8FAFC),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ABOUT INTELLECTUAL SOLUTIONS',
          style: TextStyle(
            color: Color(0xFF2563EB),
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Simple technology.\nPractical solutions.',
          style: TextStyle(
            fontSize: 42,
            height: 1.15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'Intellectual Solutions focuses on building practical '
          'software products that help businesses move from manual '
          'processes to connected digital operations.',
          style: TextStyle(fontSize: 17, height: 1.7, color: Color(0xFF64748B)),
        ),
      ],
    );
  }

  Widget _technologyBox() {
    return Container(
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Technology Stack',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF334155),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // CONTACT
  // ----------------------------------------------------------

  Widget _contactSection(BuildContext context, bool isMobile) {
    return _section(
      background: const Color(0xFF0F172A),
      child: Column(
        children: [
          const Text(
            'Let’s build something useful.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Have a software idea or need a digital solution?',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 17),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              _contactButton(Icons.phone, 'Call Us', _callUs),
              _contactButton(Icons.chat, 'WhatsApp', _openWhatsApp),
              _contactButton(Icons.email, 'Email', _sendEmail),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactButton(IconData icon, String title, VoidCallback onPressed) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(0.25)),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // ----------------------------------------------------------
  // FOOTER
  // ----------------------------------------------------------

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      color: const Color(0xFF020617),
      child: const Center(
        child: Text(
          '© 2026 Intellectual Solutions. All rights reserved.',
          style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // COMMON SECTION
  // ----------------------------------------------------------

  Widget _section({required Color background, required Widget child}) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }

  Widget _sectionHeading(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 17, color: Color(0xFF64748B)),
        ),
      ],
    );
  }
}
