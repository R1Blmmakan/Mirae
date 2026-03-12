import 'package:flutter/material.dart';
import 'dart:ui';

class DetailPaketPage extends StatelessWidget {
  final String headerImage;
  final String title;
  final String subtitle;
  final String price;

  const DetailPaketPage({
    super.key,
    required this.headerImage,
    this.title = '',
    this.subtitle = '',
    this.price = '',
  });

  @override
  Widget build(BuildContext context) {
    final String tripTitle = title.isNotEmpty ? title : 'SOLO TRIP';
    final String tripSubtitle = subtitle.isNotEmpty ? subtitle : '1 PERSON';
    final String tripPrice = price.isNotEmpty ? price : 'IDR 9.895.160';
    final bool isFamily = tripTitle.toUpperCase().contains('FAMILY');


    final _SimpleCardInfo tourismInfo = isFamily
        ? _SimpleCardInfo(
            title: 'BURJ KHALIFA',
            subtitle: '$tripSubtitle (CHILD FREE)',
            price: 'IDR 970.320',
          )
        : _SimpleCardInfo(
            title: 'TOURISM',
            subtitle: 'BURJ KHALIFA (2 person, 1 Child)',
            price: 'IDR 485.160',
          );

    final List<String> religionTourism = const [
      'Sheikh Zayed Grand Mosque',
      'Abrahamic Family House',
      'Gurunanak Darbar Temple',
      'Mahewnao Buddhist Temple',
    ];

    final _TicketInfo ticketInfo = isFamily
        ? const _TicketInfo(
            airline: 'ETIHAD AIRWAYS',
            route: 'CGK - AUH, Transit CMB',
            price: 'IDR 13.000.000 (Round-Trip)',
            image: 'assets/img/pesawat.webp',
          )
        : const _TicketInfo(
            airline: 'ETIHAD AIRWAYS',
            route: 'CGK - AUH, Transit CMB',
            price: 'IDR 6.000.000 (Round-Trip)',
            image: 'assets/img/pesawat.webp',
          );

    final List<_StayInfo> stays = isFamily
        ? const [
            _StayInfo(
              name: 'Ramada By Wyndham Dubai Barsha Heigths',
              detail: 'Standar Room (Breakfast)\n• 1 Bedroom\n• 1 Bathroom\n• 2 x Twin Bed\n',
              image: 'assets/img/hotel.webp',
              price: 'IDR 2.800.000 (2 Nights)',
            ),
          ]
        : const [
            _StayInfo(
              name: 'Ramada By Wyndham Dubai Barsha Heigths',
              detail: 'Standar King Room (Breakfast)\n• 1 Bedroom\n• 1 Bathroom\n• 1 King Bed\n',
              image: 'assets/img/hotel.webp',
              price: 'IDR 1.500.000 (2 Nights)',
            ),
          ];

    return Scaffold(
      backgroundColor: const Color(0xFF9CAB84),
      body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const SizedBox(height: 35),

      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Tourism",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 20),

      Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFFE7EBEF),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Welcome To",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            _HeaderTripCard(
              image: headerImage,
              title: tripTitle,
              subtitle: tripSubtitle,
              price: tripPrice,
              onBack: () => Navigator.pop(context),
              onBookNow: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Booked: $tripTitle'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),

            const SizedBox(height: 18),

            _SectionTitle('ROUTE'),
              const SizedBox(height: 10),
              
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/img/solo_route1.webp",
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),


            const SizedBox(height: 18),

Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.black26),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [


      const SizedBox(height: 6),

      Text(
        tourismInfo.title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),

      Text(
        tourismInfo.subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
      ),

      const SizedBox(height: 6),

      Text(
        tourismInfo.price,
        style: const TextStyle(
          color: Color(0xFFFFA000),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 18),

Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.black26),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const Text(
        "RELIGION TOURISM",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 6),

      ...religionTourism.map(
        (item) => Text(
          item,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ),

      const SizedBox(height: 6),

      const Text(
        "FREE",
        style: TextStyle(
          color: Color(0xFFFFA000),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

            const SizedBox(height: 18),

            _SectionTitle('AIRPLANE TICKET'),
            const SizedBox(height: 10),

            _TicketCard(info: ticketInfo),

            const SizedBox(height: 18),

            _SectionTitle('Accommodation'),
const SizedBox(height: 10),

...stays.map((s) => Padding(
  padding: const EdgeInsets.only(bottom: 12),
  child: _StayCard(info: s),
)),

const SizedBox(height: 18),

_SectionTitle('Tour Guide'),
const SizedBox(height: 10),

const _TourGuideCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    ],
  ),
),
    );
  }
}

class _HeaderTripCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onBack;
  final VoidCallback onBookNow;

  const _HeaderTripCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onBack,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      width: double.infinity,
      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 460,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.35),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
                  
                  child: Row(
  children: [

    /// CARD 1 (INFO TRIP)
    Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFFFFC107),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),

    const SizedBox(width: 10),

    /// CARD 2 (BOOK NOW)
    ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: onBookNow,
                child: const Text(
                  "BOOK NOW!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 2),

              const Text(
                "*Not including meals",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ],
),

          ),

          Positioned(
            top: 14,
            left: 14,
            child: GestureDetector(
              onTap: onBack,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.6,
      ),
    );
  }
}

class _RouteCard extends StatelessWidget {
  final _RouteStop stop;
  const _RouteCard({required this.stop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.asset(
              stop.image,
              height: 70,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  stop.day,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F3B2D),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  stop.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class _SimpleInfoCard extends StatelessWidget {
  final _SimpleCardInfo info;
  const _SimpleInfoCard({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "TOURISM",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            info.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            info.subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            info.price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFA000),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListInfoCard extends StatelessWidget {
  final String title;
  final List<String> lines;
  final String footer;

  const _ListInfoCard({
    required this.title,
    required this.lines,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...lines.map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                t,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            footer,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFA000),
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketCard extends StatelessWidget {
  final _TicketInfo info;
  const _TicketCard({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.airline,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  info.route,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  info.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFA000),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              info.image,
              width: 92,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 92,
                  height: 70,
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_not_supported, size: 18),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StayCard extends StatelessWidget {
  final _StayInfo info;
  const _StayCard({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  info.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  info.detail,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  info.price,
                  style: TextStyle(
                    color: Color(0xFFFFA000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              info.image,
              width: 120,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteStop {
  final String image;
  final String day;
  final String title;
  const _RouteStop(this.image, this.day, this.title);
}

class _SimpleCardInfo {
  final String title;
  final String subtitle;
  final String price;
  _SimpleCardInfo({
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

class _TicketInfo {
  final String airline;
  final String route;
  final String price;
  final String image;
  const _TicketInfo({
    required this.airline,
    required this.route,
    required this.price,
    required this.image,
  });
}

class _StayInfo {
  final String name;
  final String detail;
  final String image;
  final String price;
  const _StayInfo({
    required this.name,
    required this.detail,
    required this.image,
    required this.price,
  });
}

class _TourGuideCard extends StatelessWidget {
  const _TourGuideCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Tour Guide",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            "Include Transportation",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),  

          const SizedBox(height: 8),

          const Text(
            "IDR 2.000.000",
            style: TextStyle(
              color: Color(0xFFFFA000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}