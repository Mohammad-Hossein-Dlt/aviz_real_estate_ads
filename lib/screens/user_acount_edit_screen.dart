import 'package:aviz/constants/colors.dart';
import 'package:aviz/constants/iconsax_icons.dart';
import 'package:aviz/sample_data.dart';
import 'package:flutter/material.dart';

class UserAcountEditScreen extends StatefulWidget {
  const UserAcountEditScreen({super.key});

  @override
  State<UserAcountEditScreen> createState() => _UserAcountEditScreenState();
}

class _UserAcountEditScreenState extends State<UserAcountEditScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = userSampleData["name"] ?? "";
    phone.text = userSampleData["phone-number"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              elevation: 2,
              shadowColor: grey.withOpacity(0.5),
              forceElevated: true,
              leading: const SizedBox(),
              title: const Text(
                "ویرایش پروفایل",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Transform.scale(
                    scaleX: -1,
                    child: const Icon(
                      Iconsax.arrow_left_2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/images/profile.png",
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  elevation: 2,
                                  shadowColor: grey,
                                  maximumSize: const Size(40, 40),
                                  minimumSize: const Size(40, 40),
                                ),
                                onPressed: () {},
                                icon: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "نام و نام خانوادگی",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        width: 343,
                        // height: 48,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          border: Border.all(color: grey, width: 4),
                          color: grey,
                        ),
                        child: Center(
                          child: TextField(
                            controller: name,
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            minLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintTextDirection: TextDirection.rtl,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              hintText: userSampleData["name"] ?? "",
                              hintStyle: const TextStyle(
                                color: grey3,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "شماره موبایل",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 343,
                      // height: 48,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2)),
                        border: Border.all(color: grey, width: 4),
                        color: grey,
                      ),
                      child: Center(
                        child: TextField(
                          controller: phone,
                          maxLines: 1,
                          minLines: 1,
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(letterSpacing: 10),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            hintText: "شماره موبایل",
                            hintStyle: TextStyle(
                              color: grey3,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ثبت تغییرات",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
