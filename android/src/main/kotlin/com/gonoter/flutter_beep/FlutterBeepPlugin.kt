package com.gonoter.flutter_beep

import android.media.AudioManager
import android.media.ToneGenerator
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterBeepPlugin */
class FlutterBeepPlugin : FlutterPlugin, MethodCallHandler {
    private val toneGen = ToneGenerator(AudioManager.STREAM_SYSTEM, 100)
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_beep")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "playSysSound" -> {
                val soundId = call.argument<Int>("soundId") ?: 0
                playSysSound(soundId)
                result.success(true)
            }
            "stopSysSound" -> {
                stopSysSound()
                result.success(true)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun playSysSound(soundID: Int) {
        toneGen.startTone(soundID)
    }

    private fun stopSysSound() {
        toneGen.stopTone()
    }
}
