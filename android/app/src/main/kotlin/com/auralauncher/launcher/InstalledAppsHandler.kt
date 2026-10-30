package com.auralauncher.launcher

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.PackageInfo
import android.provider.Settings
import java.util.ArrayList

data class AppInfo(
    val packageName: String,
    val className: String,
    val label: String,
    val iconResource: Int,
    val enabled: Boolean
)

class InstalledAppsHandler(private val context: Context) {

    fun getInstalledApps(): List<AppInfo> {
        val apps = mutableListOf<AppInfo>()
        val pm = context.packageManager

        try {
            val info = pm.getInstalledPackages(0)
            for (pkg in info) {
                if (pkg.packageName == context.packageName) continue
                apps.add(
                    AppInfo(
                        packageName = pkg.packageName,
                        className = if (pkg.applicationInfo != null && !pkg.applicationInfo.className.isNullOrEmpty()) pkg.applicationInfo.className else "",
                        label = pkg.packageName,
                        iconResource = 0,
                        enabled = (pkg.applicationInfo?.enabled ?: false) && pkg.enabled
                    )
                )
            }
        } catch (e: Exception) {
            println("Error getting installed apps: ${e.message}")
        }
        return apps
    }

    fun launchApp(context: Context, packageName: String): Boolean {
        return try {
            val intent = Intent(Intent.ACTION_MAIN).apply {
                component = android.content.ComponentName(packageName, "")
                addCategory(Intent.CATEGORY_LAUNCHER)
            }
            context.startActivity(intent)
            true
        } catch (e: Exception) {
            false
        }
    }

    private fun getLaunchIcon(@Suppress("UNUSED_PARAMETER") opts: Any?) = 0
}