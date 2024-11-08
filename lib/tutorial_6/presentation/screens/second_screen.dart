import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/counter_cubit6.dart';
import 'package:flutter_block_tutorials/tutorial_6/logic/cubit/counter_state6.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  Color color;

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasInremented) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(
                          milliseconds:
                              300), // Use milliseconds instead of microseconds for better visibility
                    ),
                  );
                } else if (!state.wasInremented) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(
                          milliseconds:
                              300), // Use milliseconds instead of microseconds for better visibility
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'ops, NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'yeah ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'okay, NUMBER 5',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else
                  // ignore: curly_braces_in_flow_control_structures
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text(widget.title),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
              ),
              child: Text(
                "Go to third screen",
                selectionColor: widget.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
