import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/show_controller.dart';
import 'package:pas_mobile_11pplg2_28/controllers/favorite_controller.dart';

class TvshowPage extends StatelessWidget {
  TvshowPage({super.key});

  final TableShow controller = Get.put(TableShow());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchAPITableShow();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.tableStandings.length,
              itemBuilder: (context, index) {
                final team = controller.tableStandings[index];
                final isFav = favoriteController.isFavorite(team);

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.image.original),
                      radius: 25,
                    ),
                    title: Text(team.name),
                    subtitle: Text(
                      "${team.language}\nRuntime: ${team.runtime}\n${team.status}",
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isFav ? Icons.bookmark : Icons.bookmark_border,
                        color: isFav ? Colors.blueAccent : Colors.grey,
                      ),
                      onPressed: () {
                        favoriteController.toggleFavorite(team);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
