package com.apportable.demo;

import android.util.Log;

import java.util.List;
import java.util.ArrayList;

public class HelloBridge {

    private int mIntValue;
    private double mDoubleVal;
    private List<Object> mListVal;

    private static final String TAG = "HelloBridge";

    private native void bridgeCallback(int i, double d);

    public HelloBridge(int i, double d) {
        mIntValue = i;
        mDoubleVal = d;
        mListVal = new ArrayList<Object>();
        mListVal.add(new Object()); // Object works
        mListVal.add(new String()); // String works
        mListVal.add(new Integer(0)); // Integer works
        mListVal.add(new MyBridgeObject()); // Custom object does NOT work
        mListVal.add(new MyBridgeObject());
        mListVal.add(new MyBridgeObject());
    }

    public void setIntValue(int i) {
        mIntValue = i;
        Log.d(TAG, "Java int value changed " + i);
        bridgeCallback(mIntValue, mDoubleVal);
    }

    public int getIntValue() {
        return mIntValue;
    }

    public void setDoubleValue(double d) {
        mDoubleVal = d;
        Log.d(TAG, "Java double value changed " + d);
        bridgeCallback(mIntValue, mDoubleVal);
    }

    public double getDoubleValue() {
        return mDoubleVal;
    }

    public List<Object> getListValue() {
        return mListVal;
    }
}