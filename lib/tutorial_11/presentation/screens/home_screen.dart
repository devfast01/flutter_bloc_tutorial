import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/main.dart';
import 'package:flutter_block_tutorials/tutorial_11/constants/internet_enum.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/counter_cubit11.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/counter_state11.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/internet_cubit11.dart';
import 'package:flutter_block_tutorials/tutorial_11/logic/cubit/internet_state11.dart';

// ignore: must_be_immutable
class HomeScreen11 extends StatefulWidget {
  HomeScreen11({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  Color color;

  @override
  HomeScreen11State createState() => HomeScreen11State();
}

class HomeScreen11State extends State<HomeScreen11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings')),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  context.read<CounterCubit>().increment();
                  greenLog('wifi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  context.read<CounterCubit>().decrement();
                  greenLog('mobile');
                } else if (state is InternetDisconnected) {
                  greenLog('disconnected');
                }
              },
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Wi-Fi',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.green,
                        ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.red,
                        ),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(
                          milliseconds:
                              300), // Use milliseconds instead of microseconds for better visibility
                    ),
                  );
                } else if (!state.wasIncremented) {
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
            Builder(
              builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Counter: ${counterState.counterValue} Internet: Mobile',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Counter: ${counterState.counterValue} Internet: Wifi',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                } else {
                  return Text(
                    'Counter: ${counterState.counterValue} Internet: Disconnected',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Builder(
              builder: (context) {
                final counterValue = context
                    .select((CounterCubit cubit) => cubit.state.counterValue);
                return Text(
                  'Counter: $counterValue',
                  style: Theme.of(context).textTheme.titleLarge,
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
                Navigator.of(context).pushNamed('/second');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
              ),
              child: Text(
                "Go to second screen",
                selectionColor: widget.color,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
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
