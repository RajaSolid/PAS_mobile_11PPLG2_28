import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteController controller = Get.find<FavoriteController>();

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Shows"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return const Center(child: Text("Belum ada show yang difavoritkan."));
        }

        return ListView.builder(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            final show = controller.favoriteList[index];

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(show.image.original),
                  radius: 25,
                ),
                title: Text(show.name),
                subtitle: Text(show.language.name),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.bookmark_remove,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    controller.toggleFavorite(show);

                    Get.snackbar(
                      "Dihapus dari Favorit",
                      "${show.name} telah dihapus.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.withOpacity(0.2),
                      colorText: Colors.black,
                      duration: const Duration(seconds: 2),
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
