package com.auralauncher

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformViewRegistry
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.auralauncher/bridge"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getInstalledApps" -> {
                        result.success(InstalledAppsHandler(this).getInstalledApps())
                    }
                    "requestHomePermission" -> {
                        result.success(LauncherRoleHandler(this).requestHomeRole())
                    }
                    else -> result.notImplemented()
                }
            }

        val registry = flutterEngine.platformViewsController.registry
        registry.registerViewFactory("aura_widget_view", AuraWidgetFactory(flutterEngine.dartExecutor.binaryMessenger))
    }
}