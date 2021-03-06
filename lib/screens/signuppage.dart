import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newnippon/services/authservice.dart';

import 'dashboard.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nameController;

  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _name;
  bool secure = true;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context, errormsg) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(
            fontSize: 16.5,
            color: Colors.red.shade700,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(
        errormsg,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showloadingscreen(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red[700]),
          ),
          SizedBox(width: 20),
          Text(
            "Please Wait...",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.black,
                              onPressed: () {
                                _emailController.clear();
                                _passwordController.clear();
                                _nameController.clear();
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: "New",
                                                  style: TextStyle(
                                                    fontSize: 50,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                    text: "Nippon",
                                                    style: TextStyle(
                                                      fontSize: 50,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: ".com",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .red.shade700,
                                                            fontSize: 50,
                                                            fontFamily:
                                                                "KaushanScript"),
                                                      )
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: TextFormField(
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            validator: (name) {
                                              if (name.length > 0) {
                                                return null;
                                              } else {
                                                return "Enter Full Name";
                                              }
                                            },
                                            onSaved: (name) {
                                              setState(() {
                                                _name = name;
                                              });
                                            },
                                            controller: _nameController,
                                            decoration: InputDecoration(
                                                disabledBorder:
                                                    InputBorder.none,
                                                isDense: true,
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  gapPadding: 0,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    gapPadding: 0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                errorStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                hintText: 'eg. Alex',
                                                hintStyle: TextStyle(
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            cursorColor: Colors.black,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (email) {
                                              bool emailValid = RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(email.trim());
                                              if (!emailValid) {
                                                if (email.length == 0)
                                                  return "Enter Email Id";
                                                return "Enter valid Email Id";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onSaved: (email) {
                                              setState(() {
                                                _email = email;
                                              });
                                            },
                                            controller: _emailController,
                                            decoration: InputDecoration(
                                                disabledBorder:
                                                    InputBorder.none,
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  gapPadding: 0,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    gapPadding: 0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                errorStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                hintText: 'Enter your Email Id',
                                                hintStyle: TextStyle(
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr,
                                            cursorColor: Colors.black,
                                            validator: (password) {
                                              bool passwordValid = RegExp(
                                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                                  .hasMatch(password.trim());
                                              if (!passwordValid) {
                                                if (password.length == 0)
                                                  return "Enter Password";
                                                return "Enter valid Password";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onSaved: (password) {
                                              setState(() {
                                                _password = password;
                                              });
                                            },
                                            controller: _passwordController,
                                            enableInteractiveSelection: false,
                                            obscureText: secure,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: Colors.grey.shade100,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                gapPadding: 0,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  gapPadding: 0,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              disabledBorder: InputBorder.none,
                                              errorStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              suffixIcon: IconButton(
                                                icon: secure
                                                    ? Icon(Icons.lock_outline,
                                                        size: 26)
                                                    : Icon(Icons.lock_open,
                                                        size: 26),
                                                color: Colors.grey[500],
                                                onPressed: () {
                                                  setState(() {
                                                    secure = !secure;
                                                  });
                                                },
                                              ),
                                              hintText: 'Password',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Center(
                                    child: MaterialButton(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      visualDensity: VisualDensity.comfortable,
                                      child: Container(
                                          child: Center(
                                              child: Text(
                                            "Create Account",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          )),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              70,
                                          height: 50),
                                      color: Colors.red.shade700,
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          showloadingscreen(context);
                                          List result = await AuthService()
                                              .signup(
                                                  _email.trim(),
                                                  _password.trim(),
                                                  _name.trim());

                                          if (result[0]) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DashBoard(),
                                              ),
                                            );
                                          } else {
                                            {
                                              Navigator.of(context).pop();
                                              showAlertDialog(
                                                  context, result[1]);
                                            }
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.0),
                                          child: Text(
                                            "Already have a account!",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _emailController.clear();
                                            _passwordController.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            ' Login',
                                            style: TextStyle(
                                              fontSize: 17.5,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red.shade700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
