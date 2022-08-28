import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

/// This is Home Page

class HomePage extends StatefulWidget {
  /// Constructor for Home Page
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  final WidgetbookApi _widgetBookApi = WidgetbookApi();

  String _message = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Challenge'),
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_message.isEmpty && _textEditingController.text.isEmpty)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(28),
                          child: TextField(
                            controller: _textEditingController,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              setState(() {
                                _loading = true;
                              });
                              _message =
                                  await _widgetBookApi.welcomeToWidgetbook(
                                message: _textEditingController.text,
                              );
                              setState(() {
                                _loading = false;
                              });
                            } catch (e) {
                              setState(() {
                                _loading = false;
                                _message = '';
                                _textEditingController.clear();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Oops! Something went wrong. Sorry!',
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        )
                      ],
                    ),
                  if (_message.isNotEmpty &&
                      _textEditingController.text.isNotEmpty)
                    Text(_message)
                ],
              ),
      ),
    );
  }
}
