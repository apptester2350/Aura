package com.auralauncher

import android.content.Context
import android.view.View
import android.widget.FrameLayout
import io.flutter.plugin.platform.PlatformView
import android.appwidget.AppWidgetHost
import android.appwidget.AppWidgetHostView

class AuraWidgetPlatformView(
    private val context: Context,
    private val id: Int
) : PlatformView {
    private val container = FrameLayout(context)
    private val host = AppWidgetHost(context, 10001)

    init {
        host.startListening()
        val widgetView = host.createView(context, id, null)
        container.addView(widgetView)
    }

    override fun getView(): View = container
    override fun dispose() {
        host.stopListening()
    }

    override fun onFlutterViewAttached(flutterView: View) {}
    override fun onFlutterViewDetached() {}
}
