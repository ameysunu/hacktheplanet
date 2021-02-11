import 'package:flutter/material.dart';
import 'package:new_relic_plugin/new_relic_plugin.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String _platformVersion = 'Unknown';
  String _actionId = 'eu01xx25c3c78d1743ef6a23eb3a6ddba3aa14c0f5-NRMA';
  final Map<String, dynamic> attributes = <String, dynamic>{
    'TEST_ATTR': 'TEST_VALUE'
  };

  @override
  void initState() {
    super.initState();
    startInteraction();
  }

  Future<void> startInteraction() async {
    String action_id;
    try {
      action_id = await NewRelicPlugin.startInteraction('TEST_INTERACTION');
    } on Exception {
      action_id = 'Failed to get interaction id.';
    }
    if (!mounted) return;
    setState(() {
      _actionId = action_id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Started Interaction With Id: $_actionId"),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('SEND STRING TEST ATTRIBUTE'),
                  onPressed: () {
                    NewRelicPlugin.setStringAttribute(
                        'TEST_STRING', 'Test Value');
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('SEND DOUBLE TEST ATTRIBUTE'),
                  onPressed: () {
                    NewRelicPlugin.setDoubleAttribute('TEST_DOUBLE', 0.5);
                    print(_actionId);
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('SEND BOOLEAN TEST ATTRIBUTE'),
                  onPressed: () {
                    NewRelicPlugin.setBooleanAttribute('TEST_BOOLEAN', true);
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('INCREMENT DOUBLE ATTRIBUTE'),
                  onPressed: () {
                    NewRelicPlugin.incrementAttribute('TEST_DOUBLE',
                        value: 1.0);
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('INCREMENT DOUBLE ATTRIBUTE'),
                  onPressed: () {
                    NewRelicPlugin.recordBreadcrumb('TEST_BREADCRUMB',
                        attributes: attributes);
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('END INTERACTION'),
                  onPressed: () {
                    if (_actionId != '') {
                      NewRelicPlugin.endInteraction(_actionId);
                    }
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('RECORD CUSTOM EVENT'),
                  onPressed: () {
                    NewRelicPlugin.recordCustomEvent('TEST_EVENT');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
