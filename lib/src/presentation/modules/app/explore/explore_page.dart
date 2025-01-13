import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/src/presentation/Shared/components.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<String> news = [
    "Breaking News: Durian App 3.0 Released!",
    "New Updates in Durian Farm",
    "Durain News Sample",
    "Durain News Sample to Watch in 2024",
    "Durain News Sample You Need in 2024",
  ];

  final List<String> categories = [
    "Durain Farms",
    "Durain Hunt",
    "Durain Harvast",
    "Durain Vendors",
  ];

  final List<IconData> categoryIcons = [
    Icons.business,
    Icons.health_and_safety,
    Icons.sports_basketball,
    Icons.movie,
  ];

  final List<Map<String, String>> globalNews = [
    {
      "headline": "Global warming continues to impact agriculture worldwide",
      "date": "Dec 10, 2024",
    },
    {
      "headline": "SpaceX launches another successful mission",
      "date": "Dec 8, 2024",
    },
    {
      "headline": "COVID-19 vaccines show promise in preventing new variants",
      "date": "Dec 5, 2024",
    },
    {
      "headline": "Global inflation hits record highs across multiple regions",
      "date": "Dec 3, 2024",
    },
    {
      "headline": "New UN climate report warns of dire future without action",
      "date": "Dec 1, 2024",
    },
  ];

  final List<String> imageUrl = [
    "https://web14.bernama.com/storage/photos/bd378a2bf725fb77c1b7943672e4d1b564702e6ef408e",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PeXdWW31Ggm-dFyv7gyqUzNQzB_dCDoiSw&s",
    "https://malaysianchefs.com/wp-content/uploads/2023/05/37.-Durian-small.jpg",
    "https://web14.bernama.com/storage/photos/bd378a2bf725fb77c1b7943672e4d1b564702e6ef408e",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PeXdWW31Ggm-dFyv7gyqUzNQzB_dCDoiSw&s",
    "https://malaysianchefs.com/wp-content/uploads/2023/05/37.-Durian-small.jpg",
    "https://web14.bernama.com/storage/photos/bd378a2bf725fb77c1b7943672e4d1b564702e6ef408e",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PeXdWW31Ggm-dFyv7gyqUzNQzB_dCDoiSw&s",
    "https://malaysianchefs.com/wp-content/uploads/2023/05/37.-Durian-small.jpg",
    "https://malaysianchefs.com/wp-content/uploads/2023/05/37.-Durian-small.jpg",
    "https://malaysianchefs.com/wp-content/uploads/2023/05/37.-Durian-small.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Latest News Section
              const Text(
                'Latest News',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            news[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Category Section
              Row(
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        // Handle view all action
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: getWidth(100, context),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(categories.length, (index) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            categoryIcons[index],
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          categories[index],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),

              // Global News Section
              const Text(
                'Global News',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: globalNews.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                globalNews[index]["headline"]!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                globalNews[index]["date"]!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
