package com.auralauncher.widgets

import android.appwidget.AppWidgetManager
import android.content.Context
import android.os.Bundle

class WidgetLayoutBridge(private val context: Context) {

    fun getWidgetOptions(appWidgetId: Int): Map<String, Any> {
        val manager = AppWidgetManager.getInstance(context)
        val options = manager.getAppWidgetOptions(appWidgetId)
        return options.toMap()
    }

    fun updateWidgetOptions(appWidgetId: Int, width: Int, height: Int): Boolean {
        val manager = AppWidgetManager.getInstance(context)
        val options = Bundle()
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH, width)
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT, height)
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MAX_WIDTH, width)
        options.putInt(AppWidgetManager.OPTION_APPWIDGET_MAX_HEIGHT, height)
        manager.updateAppWidgetOptions(appWidgetId, options)
        return true
    }
}