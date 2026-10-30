package com.auralauncher.display

import android.view.DisplayCutout
import android.view.WindowInsets
import android.view.WindowManager
import android.app.Activity
import android.graphics.Rect

class DisplayCutoutHandler(private val activity: Activity) {

    fun getSafeInsets(): Rect {
        val wm = activity.getSystemService(Activity.WINDOW_SERVICE) as WindowManager
        val display = wm.defaultDisplay
        val cutout = display.cutout

        if (cutout != null) {
            return Rect(
                cutout.safeInsetLeft,
                cutout.safeInsetTop,
                cutout.safeInsetRight,
                cutout.safeInsetBottom
            )
        }
        return Rect(0, 0, 0, 0)
    }

    fun hasCutout(): Boolean {
        val wm = activity.getSystemService(Activity.WINDOW_SERVICE) as WindowManager
        return wm.defaultDisplay.cutout != null
    }

    fun getScreenHeight(): Int {
        return activity.resources.displayMetrics.heightPixels
    }

    fun getScreenWidth(): Int {
        return activity.resources.displayMetrics.widthPixels
    }
}