import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        leading: const Icon(Icons.menu_rounded),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableWidget(),
                ),
                Expanded(
                  child: ReusableWidget(),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableWidget(),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableWidget(),
                ),
                Expanded(
                  child: ReusableWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  const ReusableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF1D1E33),
      ),
    );
  }
}
