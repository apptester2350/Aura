package com.auralauncher.launcher

import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.content.pm.PackageManager.PackageInfoFlags
import android.os.Bundle
import android.content.Context

class LauncherRoleHandler(private val context: Context) {

    fun requestHomeRole(): Boolean {
        val launcherRecords = context.packageManager
            .queryIntentActivities(
                Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME),
                PackageManager.MATCH_DEFAULT
            )
        if (launcherRecords.isNotEmpty()) {
            return true
        }
        return false
    }
}