import 'package:color_randomizer/presentation/widgets/history_list.dart';
import 'package:flutter/material.dart';

class HistoryBottomSheet extends StatelessWidget {
  const HistoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1,
      expand: false,
      builder: (context, _) {
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'All', icon: Icon(Icons.history)),
                  Tab(text: 'Favorites', icon: Icon(Icons.favorite)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HistoryList(isFavoritesOnly: false),
                    HistoryList(isFavoritesOnly: true),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
