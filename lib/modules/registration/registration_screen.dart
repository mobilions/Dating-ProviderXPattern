import 'package:dating_provider_pattern/providers/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:dating_provider_pattern/config/size_config.dart';
import 'package:dating_provider_pattern/routes/app_route.dart';

import 'package:dating_provider_pattern/utils/app_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widgets/common_button.dart';
import '../../widgets/common_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RegistrationProvider>(
       builder: (context, regProvider, child) {
         return SafeArea(
           child: Column(
             children: [
               Expanded(
                 child: SingleChildScrollView(
                   padding: EdgeInsets.symmetric(
                     horizontal: getProportionateScreenWidth(30),
                   ),
                   child: Form(
                       key: regProvider.formKey,
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       child: Column(
                         children: [
                           GestureDetector(
                             onTap: () async {
                               ImagePicker imagePicker = ImagePicker();
                               XFile? file = await imagePicker.pickImage(
                                 source: ImageSource.gallery,
                               );
                               if (file != null) {
                                 regProvider.updateImageFile(file);
                               }
                             },
                             child: regProvider.imageFile != null
                                 ? Container(
                               margin: EdgeInsets.only(
                                 top: getProportionateScreenHeight(30),
                                 bottom:
                                 getProportionateScreenHeight(50),
                               ),
                               height: getProportionateScreenHeight(210),
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: DecorationImage(
                                     image: FileImage(
                                         regProvider.imageFile!),
                                     fit: BoxFit.cover),
                               ),
                             )
                                 : Container(
                               height: getProportionateScreenHeight(210),
                               margin: EdgeInsets.only(
                                 top: getProportionateScreenHeight(30),
                                 bottom:
                                 getProportionateScreenHeight(50),
                               ),
                               child: SvgPicture.asset(
                                 AppImages.addPic,
                                 height:
                                 getProportionateScreenHeight(210),
                               ),
                             ),
                           ),
                           CommonTextField(
                             title: "Email Address",
                           ),
                           SizedBox(
                             height: getProportionateScreenHeight(26),
                           ),
                           CommonTextField(
                             title: "Password",
                           ),
                           SizedBox(
                             height: getProportionateScreenHeight(26),
                           ),
                           CommonTextField(
                             title: "Full Name",
                           ),
                           SizedBox(
                             height: getProportionateScreenHeight(26),
                           ),
                           CommonTextField(
                             title: "Age",
                           ),
                         ],
                       )),
                 ),
               ),
               CommonButton(
                 text: "SIGN UP",
                 onPresses: () {
                   Navigator.pushNamedAndRemoveUntil(context, AppRoute.dashBoardPageRoute,(route) => false,);
                 },
               )
             ],
           ),
         );
       },
      ),
    );
  }
}
