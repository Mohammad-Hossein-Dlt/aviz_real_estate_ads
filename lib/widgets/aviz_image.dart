import 'dart:io';

import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/constants/app_data_directory.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:aviz/constants/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget {
  const ImageItem({
    super.key,
    required this.onChanged,
  });
  final Function(String name) onChanged;
  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  String imageName = "";
  File? image = File("");

  void addImage() async {
    // Pick Image
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["jpg"]);
    if (result != null) {
      File image_ = File("${AppDataDirectory.cache().path}/$imageName");
      if (await image_.exists()) {
        await image_.delete();
      }
      // Naming And Copying Image to Cache Directory
      // Get Curent Date
      DateTime now = DateTime.now();
      String creationDate =
          "${now.year}${now.month}${now.day}_${now.hour}${now.minute}${now.second}";
      // Create File Name With CreationDate
      String newImageName = "$creationDate.jpg";
      // Find Image Path With NewImageName
      String newImagePath = "${AppDataDirectory.cache().path}/$newImageName";
      // Copying And Naming Image With NewImagePath
      File(result.files.single.path!).copy(newImagePath).then((value) {
        imageName = newImageName;
        widget.onChanged(newImageName);
        setState(() {
          image = File(newImagePath);
          imageCache.clear();
          imageCache.clearLiveImages();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return imageName.isEmpty
        ? DottedBorder(
            color: grey3,
            radius: const Radius.circular(2),
            dashPattern: const [4, 6],
            strokeWidth: 1.5,
            child: SizedBox(
              width: 343,
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "لطفا تصویر آویز خود را بارگذاری کنید",
                    style: TextStyle(
                      color: grey3,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      await Future(addImage);
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      width: 149,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Row(
                        children: [
                          Text(
                            "انتخاب تصویر",
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Iconsax.document_upload,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Stack(
            children: [
              Container(
                width: 343,
                height: 160,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.file(
                      image!,
                      key: UniqueKey(),
                      errorBuilder: (context, error, stackTrace) =>
                          const Text("عکس موجود نیست"),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                left: 0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () async {
                    await Future(addImage);
                  },
                  child: const Icon(
                    Iconsax.edit,
                    color: red,
                    size: 24,
                  ),
                ),
              ),
            ],
          );
  }
}
