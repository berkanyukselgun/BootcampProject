import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../constants/theme/theme_constants.dart';
import '../../services/storage/storage_service.dart';

class ProfilePhotoWidget extends StatefulWidget {
  final double radius;
  final String? photoUrl;
  const ProfilePhotoWidget({super.key, required this.radius, required this.photoUrl});

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: StorageService.instance.downloadPPic(widget.photoUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final imageData = snapshot.data!;
            return CircleAvatar(
              backgroundColor: AppColors.bgColor,
              radius: widget.radius,
              backgroundImage: MemoryImage(imageData),
            );
          } else if (snapshot.hasError) {
            return CircleAvatar(
              backgroundColor: AppColors.vanillaShake.withOpacity(0.8),
              radius: widget.radius,
              child: Icon(
                Icons.error,
                color: AppColors.bgColor,
                size: widget.radius,
              ),
            );
          } else {
            // situation null
            return CircleAvatar(
              radius: widget.radius,
              backgroundColor: AppColors.vanillaShake.withOpacity(0.8),
              child: Icon(
                Icons.person,
                color: AppColors.bgColor,
                size: widget.radius,
              ),
            );
          }
        } else {
          // situation in progress
          return SizedBox(width: widget.radius * 2, height: widget.radius * 2, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
