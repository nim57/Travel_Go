import 'package:flutter/material.dart';
import 'package:travel_project2024/packegs/Views/ui/Create_new_account.dart';
import 'package:travel_project2024/packegs/Views/ui/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/image/back.png"))
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(children: [
          Positioned(bottom: 0, child: _buildBettom()),
        ],)
      ),
    );
  }

  Widget _buildBettom(){
    return SizedBox(
        width: mediaSize.width,
        child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }


  Widget _buildForm(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
           "Wellcome",
            style: TextStyle(
            color: Colors.orange, fontSize: 30, fontWeight: FontWeight.w500),),
            _buildGeryText("Please Login with your Information"),
            const SizedBox(height: 40),
            _buildGeryText("Username"),
            _buildInputField(emailController),
            const SizedBox(height: 35),
            _buildGeryText("Password"),
            _buildInputField(passwordController,isPassword: true),
             const SizedBox(height: 20),
             _buildLoginButton(),

      ],
    );
  }


  Widget  _buildGeryText(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey
      )
    );
  }

  Widget _buildInputField(TextEditingController controller,
  {isPassword = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) :Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget  _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()));
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Colors.orange,
        backgroundColor: Colors.orange,
        minimumSize: const Size.fromHeight(50),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(
            color: Colors.white, fontSize: 18),),
    );
  }
}
