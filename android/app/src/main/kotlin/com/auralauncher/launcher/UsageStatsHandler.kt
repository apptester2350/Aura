package com.auralauncher.launcher

import android.content.Context
import android.app.usage.UsageStatsManager
import android.app.usage.UsageEvents
import java.util.*

class UsageStatsHandler(private val context: Context) {

    fun getMostUsedApps(limit: Int = 10): List<String> {
        val usageStatsManager = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val endTime = System.currentTimeMillis()
        val startTime = endTime - 1000 * 60 * 60 * 24 * 7 // 7 days ago

        val stats = usageStatsManager.queryUsageStats(
            UsageStatsManager.INTERVAL_DAILY,
            startTime,
            endTime
        )

        val appUsage = mutableMapOf<String, Long>()
        stats?.forEach { stat ->
            if (stat.lastTimeUsed > 0) {
                appUsage[stat.packageName] = (appUsage[stat.packageName] ?: 0) + stat.totalTimeInForeground
            }
        }

        return appUsage.entries
            .sortedByDescending { it.value }
            .take(limit)
            .map { it.key }
    }
}