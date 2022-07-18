import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const JobApplicationFlow(),
    );
  }
}

class JobApplicationFlow extends StatefulWidget {
  const JobApplicationFlow({Key? key}) : super(key: key);

  @override
  _JobApplicationFlowState createState() => _JobApplicationFlowState();
}

class _JobApplicationFlowState extends State<JobApplicationFlow>
    with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Application'),
        // Use TabBar to show the three tabs
        bottom: ReadOnlyTabBar(
          child: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.radio_button_on, color: Colors.white),
                text: 'Experience',
              ),
              Tab(
                icon: Icon(Icons.check_box, color: Colors.white),
                text: 'Skills',
              ),
              Tab(
                icon: Icon(Icons.send, color: Colors.white),
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        // make sure we can't switch tabs with interactive drag gestures
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          ExperiencePage(
            onNext: () => _tabController.index = 1,
          ),
          SkillsPage(
            onNext: () => _tabController.index = 2,
          ),
          SubmitPage(
            onSubmit: () => showCupertinoDialog(
              context: context,
              builder: (_) {
                return CupertinoAlertDialog(
                  title: const Text('Thank you'),
                  content: const Text('Your application was submitted.'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        // dismiss dialog
                        Navigator.of(context).pop();
                        _tabController.index = 0;
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// https://stackoverflow.com/a/57354375/436422
class ReadOnlyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar child;

  const ReadOnlyTabBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: child);
  }

  @override
  Size get preferredSize => child.preferredSize;
}

enum Experience {
  lessThanOneYear,
  oneToThreeYears,
  threeToFiveYears,
  overFiveYears,
}

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  Experience? _experience;

  final _experienceTitles = {
    Experience.lessThanOneYear: 'Less than one year',
    Experience.oneToThreeYears: 'One to three years',
    Experience.threeToFiveYears: 'Three to five years',
    Experience.overFiveYears: 'Over five years',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const Text('How many years of experience do you have?'),
          const SizedBox(height: 16),
          for (var item in Experience.values)
            RadioListTile<Experience>(
              title: Text(_experienceTitles[item]!),
              value: item,
              groupValue: _experience,
              onChanged: (value) {
                setState(() => _experience = value);
              },
            ),
          const Spacer(),
          PrimaryButton(
            onPressed: _experience != null ? widget.onNext : null,
            text: 'Next',
          ),
        ],
      ),
    );
  }
}

enum Skill {
  flutter,
  dart,
  firebase,
  cloudFunctions,
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final Set<Skill> _skills = {};

  final _experienceTitles = {
    Skill.flutter: 'Flutter',
    Skill.dart: 'Dart',
    Skill.firebase: 'Firebase',
    Skill.cloudFunctions: 'Cloud Functions',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const Text('Which of these skills do you have?'),
          Text(
            'Select all that apply',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 16),
          for (var item in Skill.values)
            CheckboxListTile(
              title: Text(_experienceTitles[item]!),
              value: _skills.contains(item),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _skills.add(item);
                  } else {
                    _skills.remove(item);
                  }
                });
              },
            ),
          const Spacer(),
          PrimaryButton(
            onPressed: _skills.isNotEmpty ? widget.onNext : null,
            text: 'Next',
          ),
        ],
      ),
    );
  }
}

class SubmitPage extends StatefulWidget {
  const SubmitPage({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback onSubmit;

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text('Please enter your email to submit your application.'),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              autocorrect: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.light,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Can\'t be empty';
                }
                return null;
              },
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Submit',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
