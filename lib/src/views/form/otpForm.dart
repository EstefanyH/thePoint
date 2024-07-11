import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thepointapp/src/msic/style.dart';
import 'package:thepointapp/src/util/constant.dart';
import 'package:thepointapp/src/viewModel/otpViewModel.dart';

class OtpForm extends OtpViewModel{
  
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  String inpText = '';


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String subtitle = "Hemos enviado un código de verificación OTP a su número +51 $gb_phone";

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            goBackPhoneView();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp,
          color: Colors.indigo,),),
        backgroundColor: Colors.white,),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Verificación', style: titleStyleIndigo,),
                Text(subtitle,),
                const SizedBoxH50(),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/images/illustration-3.png',
                    height: 250,
                  ),),
                const SizedBoxH50(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textfieldOTP(first: true, last: false, controller: otp1Controller),
                    _textfieldOTP(first: false, last: false, controller: otp2Controller),
                    _textfieldOTP(first: false, last: false, controller: otp3Controller),
                    _textfieldOTP(first: false, last: true, controller: otp4Controller),
                  ],
                ),
                const SizedBoxH30(),
                CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.indigo,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text( 'Verificar', 
                    style: style16White,),
                  ],), 
                  onPressed: () {  
                    inpText = otp1Controller.text;
                    inpText += otp2Controller.text;
                    inpText += otp3Controller.text;
                    inpText += otp4Controller.text; 
                    goToRaceView(inpText); 
                  }
                ),
                const SizedBoxH30(),
                const Text('Reenviar código',),
              ])
        ),),  
        
      ) 
    );
  }

  _textfieldOTP({required bool first, last, required TextEditingController controller}) {
    return  SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7, 
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {

            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }

            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(), 
            enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.black12),
              borderRadius:  BorderRadius.circular(12)
            ),
            focusedBorder:  OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.purple),
              borderRadius:  BorderRadius.circular(12)
            ),
          ),
        ),
      ),
    );
  }
}