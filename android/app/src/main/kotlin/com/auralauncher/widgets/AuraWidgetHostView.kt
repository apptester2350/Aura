package com.auralauncher.widgets

import android.appwidget.AppWidgetHostView
import android.content.Context
import android.view.View

class AuraWidgetHostView(private val context: Context, private val widgetView: View) {

    private val hostView: AppWidgetHostView?

    init {
        hostView = if (widgetView is AppWidgetHostView) widgetView else null
    }

    fun getView(): View? = hostView

    fun updateLayout(width: Int, height: Int): Boolean {
        hostView?.updateAppWidgetSize(width, height, width, height)
        return true
    }

    fun updateAppWidgetOptions(width: Int, height: Int): Boolean {
        return updateLayout(width, height)
    }

    fun getAppWidgetId(): Int? {
        return hostView?.appWidgetId
    }
}