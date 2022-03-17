import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogPage extends StatefulWidget {
  const AwesomeDialogPage({Key? key}) : super(key: key);

  @override
  State<AwesomeDialogPage> createState() => _AwesomeDialogPageState();
}

class _AwesomeDialogPageState extends State<AwesomeDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("awesome dialog"),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedButton(
                text: 'Info Dialog fixed width and sqare buttons',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO_REVERSED,
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                    width: 280,
                    buttonsBorderRadius:
                        const BorderRadius.all(Radius.circular(2)),
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'INFO',
                    desc: 'Dialog description here...',
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Question Dialog With Custom BTN Style',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Question',
                    desc: 'Dialog description here...',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Info Dialog Without buttons',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: true,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'INFO',
                    desc:
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit eget ornare tempus, vestibulum sagittis rhoncus felis hendrerit lectus ultricies duis vel, id morbi cum ultrices tellus metus dis ut donec. Ut sagittis viverra venenatis eget euismod faucibus odio ligula phasellus,',
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Warning Dialog',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          headerAnimationLoop: false,
                          animType: AnimType.TOPSLIDE,
                          showCloseIcon: true,
                          closeIcon:
                              const Icon(Icons.close_fullscreen_outlined),
                          title: 'Warning',
                          desc:
                              'Dialog description here..................................................',
                          btnCancelOnPress: () {},
                          onDissmissCallback: (type) {
                            debugPrint('Dialog Dissmiss from callback $type');
                          },
                          btnOkOnPress: () {})
                      .show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Error Dialog',
                color: Colors.red,
                pressEvent: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.RIGHSLIDE,
                          headerAnimationLoop: true,
                          title: 'Error',
                          desc:
                              'Dialog description here..................................................',
                          btnOkOnPress: () {},
                          btnOkIcon: Icons.cancel,
                          btnOkColor: Colors.red)
                      .show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Succes Dialog',
                color: Colors.green,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      animType: AnimType.LEFTSLIDE,
                      headerAnimationLoop: false,
                      dialogType: DialogType.SUCCES,
                      showCloseIcon: true,
                      title: 'Succes',
                      desc:
                          'Dialog description here..................................................',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDissmissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
                      }).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'No Header Dialog',
                color: Colors.cyan,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: false,
                    dialogType: DialogType.NO_HEADER,
                    title: 'No Header',
                    desc:
                        'Dialog description here..................................................',
                    btnOkOnPress: () {
                      debugPrint('OnClcik');
                    },
                    btnOkIcon: Icons.check_circle,
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Custom Body Dialog',
                color: Colors.blueGrey,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    body: const Center(
                      child: Text(
                        'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Auto Hide Dialog',
                color: Colors.purple,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.SCALE,
                    title: 'Auto Hide Dialog',
                    desc: 'AutoHide after 2 seconds',
                    autoHide: const Duration(seconds: 2),
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Testing Dialog',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    keyboardAware: true,
                    dismissOnBackKeyPress: false,
                    dialogType: DialogType.WARNING,
                    animType: AnimType.BOTTOMSLIDE,
                    btnCancelText: "Cancel Order",
                    btnOkText: "Yes, I will pay",
                    title: 'Continue to pay?',
                    // padding: const EdgeInsets.all(5.0),
                    desc:
                        'Please confirm that you will pay 3000 INR within 30 mins. Creating orders without paying will create penalty charges, and your account may be disabled.',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Body with Input',
                color: Colors.blueGrey,
                pressEvent: () {
                  late AwesomeDialog dialog;
                  dialog = AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    keyboardAware: true,
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Form Data',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 0,
                            color: Colors.blueGrey.withAlpha(40),
                            child: TextFormField(
                              autofocus: true,
                              minLines: 1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Title',
                                prefixIcon: Icon(Icons.text_fields),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 0,
                            color: Colors.blueGrey.withAlpha(40),
                            child: TextFormField(
                              autofocus: true,
                              keyboardType: TextInputType.multiline,
                              maxLengthEnforced: true,
                              minLines: 2,
                              maxLines: null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Description',
                                prefixIcon: Icon(Icons.text_fields),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedButton(
                              isFixedHeight: false,
                              text: 'Close',
                              pressEvent: () {
                                dialog.dismiss();
                              })
                        ],
                      ),
                    ),
                  )..show();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
