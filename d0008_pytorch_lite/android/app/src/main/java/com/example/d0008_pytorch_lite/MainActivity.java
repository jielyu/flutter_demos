package com.example.d0008_pytorch_lite;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

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
import java.util.Arrays;

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
                    } else if (call.method.equals("forward")) {
                        int width = call.argument("width");
                        int height = call.argument("height");
                        int channel = call.argument("channels");
                        byte[] data = call.argument("data");
                        System.out.println("width: " + width + " height: " + height + " channel: " + channel);
                        Bitmap img = BitmapFactory.decodeByteArray(data, 0, data.length);
                        img = Bitmap.createScaledBitmap(img, width, height, false);
                        float[] mean = { 0.485f, 0.456f, 0.406f };
                        float[] std = { 0.229f, 0.224f, 0.225f };
                        final Tensor imageInputTensor = TensorImageUtils.bitmapToFloat32Tensor(img, mean, std);
                        System.out.println(
                                "imageInputTensor: " + Arrays.toString(imageInputTensor.shape()));
                        IValue iv = mModule.forward(IValue.from(imageInputTensor));
                        // final Tensor imageOutputTensor = iv.toTensor();
                        HashMap<String, Object> map = new HashMap<>();
                        int[] shape = new int[] { 1, channel, height, width };
                        map.put("err_msg", "none");
                        map.put("shape", shape);
                        result.success(map);
                    } else {
                        result.notImplemented();
                    }
                }

        );
    }
}
