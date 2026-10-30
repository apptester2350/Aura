import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NativeAppWidget extends StatelessWidget {
  final String viewType = 'aura_widget_view';

  const NativeAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (!defaultTargetPlatform.isAndroid) {
      return Container(
        color: Colors.deepPurple,
        child: const Center(child: Text('Widgets only on Android')),
      );
    }

    return SizedBox(
      height: 150,
      width: 300,
      child: AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: const {},
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (id) {},
      ),
    );
  }
}