import 'package:dealz_app/resources/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../components/text_fields.dart';
import '../viewModel/home_view_model.dart';

class HomeDeal1Screen extends StatefulWidget {
  const HomeDeal1Screen({super.key});

  @override
  State<HomeDeal1Screen> createState() => _HomeDeal1ScreenState();
}

class _HomeDeal1ScreenState extends State<HomeDeal1Screen> {

  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final mailController = TextEditingController();
  final dateController = TextEditingController();
  final phoneController = TextEditingController();
  final locateController = TextEditingController();

  bool? isAgree = false;

  final HomeViewModel homeViewModel = Get.put<HomeViewModel>(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          'BƯỚC 1',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10, bottom: 150, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Họ và tên',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500), // Kích thước chữ
                ),
                SizedBox(width: 4), // Khoảng cách giữa text và icon
                Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.red, // Màu sắc của icon
                ),
              ],
            ),
            CustomTextField(
              controller: nameController,
              inputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 40),
            const Text(
              'Ngày sinh',
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500), // Kích thước chữ
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowTextFieldColor,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ]),
              child: TextField(
                controller: dateController,
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  counterText: "",
                  labelStyle: TextStyle(color: AppColors.placeholderTextField),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackColor),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.transparentColor),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: const Icon(Icons.calendar_month_rounded),
                ),
                onTap: () async {
                  DateTime? pickDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(pickDate);
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 40),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Số điện thoại',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500), // Kích thước chữ
                ),
                SizedBox(width: 4), // Khoảng cách giữa text và icon
                Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.red, // Màu sắc của icon
                ),
              ],
            ),
            CustomTextField(
              controller: phoneController,
              inputType: TextInputType.phone,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 40),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500), // Kích thước chữ
                ),
                SizedBox(width: 4), // Khoảng cách giữa text và icon
                Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.red, // Màu sắc của icon
                ),
              ],
            ),
            CustomTextField(
              controller: mailController,
              inputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 40),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nghề nghiệp',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500), // Kích thước chữ
                ),
                SizedBox(width: 4), // Khoảng cách giữa text và icon
                Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.red, // Màu sắc của icon
                ),
              ],
            ),
            CustomTextField(
              controller: jobController,
              inputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 40),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Địa chỉ công ty',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500), // Kích thước chữ
                ),
                SizedBox(width: 4), // Khoảng cách giữa text và icon
                Icon(
                  Icons.star,
                  size: 10,
                  color: Colors.red, // Màu sắc của icon
                ),
              ],
            ),
            CustomTextField(
              controller: locateController,
              inputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  value: isAgree,
                  activeColor: AppColors.blackColor,
                  onChanged: (value) {
                    setState(() {
                      isAgree = value;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'Điền tất cả thông tin hoặc cho phép Dealz thu thập dữ liệu qua các tài khoản mạng xã hội của bạn',
                    style: TextStyle(fontSize: 16), // Kích thước chữ
                    softWrap: true, // Cho phép xuống hàng
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        height: 60,
        child: FloatingActionButton.extended(
          onPressed: () {

          },
          backgroundColor: AppColors.blackColor,
          label: const Text(
            'Đồng ý',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center, // Màu chữ
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
