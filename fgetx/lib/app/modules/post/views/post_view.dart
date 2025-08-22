// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:fgetx/app/modules/post/views/post_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/post_controller.dart';

class PostView extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // sama dengan pemesanan makanan
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "📄 Daftar Posts",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.teal));
        }

        if (controller.posts.isEmpty) {
          return Center(
            child: Text(
              "Belum ada postingan",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];

            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 500 + (index * 100)),
              curve: Curves.easeOut,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade50, Colors.teal.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.teal.withOpacity(0.2),
                  onTap: () => Get.to(() => PostDetailView(post: post)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Avatar dengan Hero
                        Hero(
                          tag: "post_icon_${post.id}",
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: Icon(Icons.article, color: Colors.teal.shade900),
                          ),
                        ),
                        SizedBox(width: 14),

                        // Konten teks
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "post_title_${post.id}",
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    post.title ?? 'No Title',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                post.body ?? 'No Content',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
