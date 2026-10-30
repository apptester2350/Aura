package com.auralauncher

import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AuraWidgetFactory(private val messenger: io.flutter.plugin.common.BinaryMessenger?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return AuraWidgetPlatformView(context!!, viewId)
    }
}