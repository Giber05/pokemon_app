import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/types/base_exception.dart';

@RoutePage()
class StackTraceScreen extends StatelessWidget {
  const StackTraceScreen({
    Key? key,
    required this.stackTrace,
    required this.error,
  }) : super(key: key);
  final StackTrace stackTrace;
  final Object error;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Error Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            Offset(0, .5), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Message',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Text(
                        error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      if (error is BaseException)
                        Builder(builder: (context) {
                          final exception = error as BaseException;
                          return Text(
                            exception.message,
                                                    style: const TextStyle(color: Colors.red),
                          );
                        }),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            Offset(0, .5), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Text('StackTrace',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const Divider(
                        thickness: 2,
                      ),
                      Text(stackTrace.toString(),
                          style: const TextStyle(color: Colors.red)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
