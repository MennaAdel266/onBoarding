import 'package:flutter/material.dart';
import 'package:project/Shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'login now to browse our hot offers',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                defaultFormFeild(
                    type: TextInputType.emailAddress,
                    controller: emailController ,
                    prefix: Icons.email_outlined,
                    label: 'E-mail Address',
                    validate: (String value)
                    {
                      if (value.isEmpty)
                      {
                        return 'please enter your email';
                      }
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormFeild(
                  controller: passwordController,
                  onSubmit: (value) {},
                  iconButton: () {},
                  suffix:Icons.remove_red_eye,
                  type: TextInputType.visiblePassword,
                  validate: (String value)
                  {
                    if (value.isEmpty)
                    {
                      return 'please enter your password';
                    }
                  },
                  label: 'Password',
                  prefix: Icons.lock_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                    ),
                    defaultTextButton(
                      function:() {},
                      text:'Register',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
