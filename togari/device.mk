# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Device path
DEVICE_PATH := device/sony/togari

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Device etc
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/vendor/etc/mixer_paths.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf

# acdbdata
PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_Handset_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_Speaker_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Speaker_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_Bluetooth_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_General_cal.acdb:system/etc/acdbdata/Fluid/Fluid_General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_Global_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_Handset_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_Hdmi_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_Headset_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Fluid/Fluid_Speaker_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Speaker_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_Bluetooth_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_General_cal.acdb:system/etc/acdbdata/Liquid/Liquid_General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_Global_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_Hdmi_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Liquid/Liquid_Headset_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.togari \
    init.togari \
    ueventd.togari

# Lights
PRODUCT_PACKAGES += \
    lights.togari

# Lights HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Qcom PowerHAL
PRODUCT_PACKAGES += \
    power.msm8974

# Power HIDL interfaces
PRODUCT_PACKAGES += \
   android.hardware.power@1.0-impl \
   android.hardware.power@1.0-service

# NFC
PRODUCT_PACKAGES += \
    nfc.togari \
    nfc_nci.togari

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=19C

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/rhine/platform.mk)
$(call inherit-product, vendor/sony/rhine-togari/togari-vendor.mk)
