import 'package:flutter/material.dart';
import 'package:tiktok/controllers/auth_controller.dart';
import '../../widgets/text_input.dart';
import '../../../constants.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TikTok Clone',
                    style: TextStyle(
                      fontSize: 35,
                      color: buttonColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text('Register',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                        ),
                      ),
                      Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: ()=>authController.pickImage(),
                            icon: Icon(Icons.add_a_photo),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
                SingleChildScrollView(
                  child: Column(children: [
                      Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                        controller: _usernameController,
                        labelText: 'Username',
                        icon: Icons.person,
                      ),
                    ),
                    const SizedBox(  
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                        controller: _emailController,
                        labelText: 'Email',
                        icon: Icons.email,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextInputField(
                        controller: _passwordController,
                        labelText: 'Password',
                        icon: Icons.lock_outline_sharp,
                        isObscure:true,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: InkWell(
                        onTap: () => authController.registerUser(
                          _usernameController.text,
                          _emailController.text,
                          _passwordController.text,
                          authController.profilePhoto,
                        ),
                        child: const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        InkWell(
                          onTap:()=> {},
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: buttonColor),
                          ),
                        )
                      ],
                    )
                  ],),
                )
                
                ],
              ),///yahah
            
          ),
      ),
    
    );
  }
}
