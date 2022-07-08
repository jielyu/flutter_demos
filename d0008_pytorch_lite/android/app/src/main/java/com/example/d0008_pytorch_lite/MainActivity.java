package com.example.d0008_pytorch_lite;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import androidx.annotation.NonNull;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;

import org.pytorch.IValue;
import org.pytorch.LiteModuleLoader;
import org.pytorch.Module;
import org.pytorch.Tensor;
import org.pytorch.torchvision.TensorImageUtils;

import java.util.HashMap;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "test_pytorch_lite/test";
    private Module mModule;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("testStart")) {
                        HashMap<String, String> map = new HashMap<>();
                        map.put("err_msg", "none");
                        result.success(map);
                    } else if (call.method.equals("loadModel")) {
                        String modelPath = call.argument("modelPath");
                        try {
                            mModule = LiteModuleLoader.load(modelPath);
                        } catch (Exception e) {
                            HashMap<String, String> map = new HashMap<>();
                            map.put("err_msg", e.getMessage());
                            result.success(map);
                            return;
                        }
                        HashMap<String, String> map = new HashMap<>();
                        map.put("err_msg", "loadModel success");
                        result.success(map);
                    } else if (call.method.equals("predict")) {

                    } else {
                        result.notImplemented();
                    }
                }
                
        );
    }
}
