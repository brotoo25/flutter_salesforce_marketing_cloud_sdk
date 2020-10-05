package com.abraaolima.flutter_salesforce_marketing_cloud

import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.salesforce.marketingcloud.MCLogListener
import com.salesforce.marketingcloud.MarketingCloudConfig
import com.salesforce.marketingcloud.MarketingCloudSdk

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** FlutterSalesforceMarketingCloudPlugin */
class FlutterSalesforceMarketingCloudPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var context: Context

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, "flutter_salesforce_marketing_cloud")
        channel.setMethodCallHandler(this)
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_salesforce_marketing_cloud")
            channel.setMethodCallHandler(FlutterSalesforceMarketingCloudPlugin())
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "init") {
            MarketingCloudSdk.setLogLevel(MCLogListener.VERBOSE)
            MarketingCloudSdk.setLogListener(MCLogListener.AndroidLogListener())

            val mid = call.argument<String>("mid") ?: ""
            val appId = call.argument<String>("mc_application_id") ?: ""
            val fcmSenderId = call.argument<String>("fcm_sender_id") ?: ""
            val accessToken = call.argument<String>("mc_access_token") ?: ""
            val cloudUrl = call.argument<String>("marketing_cloud_url") ?: ""

            MarketingCloudSdk.init(context, MarketingCloudConfig.builder().apply {
              setMid(mid)
              setApplicationId(appId)
              setSenderId(fcmSenderId)
              setAccessToken(accessToken)
              setMarketingCloudServerUrl(cloudUrl)
            }.build(context)) { status ->
                Log.i("MarketingCloudSDK", status.toString())
                result.success(true)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
