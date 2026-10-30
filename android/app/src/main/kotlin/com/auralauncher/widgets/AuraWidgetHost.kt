package com.auralauncher.widgets

import android.appwidget.AppWidgetHost
import android.appwidget.AppWidgetHostView
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.util.Log

class AuraWidgetHost(private val context: Context, private val hostId: Int) {

    private val widgetHost: AppWidgetHost

    init {
        widgetHost = AppWidgetHost(context, hostId)
        widgetHost.startListening()
    }

    fun allocateAppWidgetId(): Int {
        return widgetHost.allocateAppWidgetId()
    }

    fun deleteAppWidgetId(appWidgetId: Int) {
        widgetHost.deleteAppWidgetId(appWidgetId)
    }

    fun createWidgetView(appWidgetId: Int, appWidgetInfo: android.appwidget.AppWidgetProviderInfo): AppWidgetHostView? {
        return widgetHost.createView(context, appWidgetId, appWidgetInfo)
    }

    fun getAppWidgetManager(): AppWidgetManager {
        return AppWidgetManager.getInstance(context)
    }

    fun getWidgetProviders(): List<android.appwidget.AppWidgetProviderInfo> {
        val manager = getAppWidgetManager()
        return manager.installedProviders
    }

    fun getBindOptions(): Bundle {
        return Bundle().apply {
            putInt(AppWidgetManager.EXTRA_APPWIDGET_ID, 0)
        }
    }

    fun stopListening() {
        widgetHost.stopListening()
    }

    fun getHostId(): Int {
        return hostId
    }
}