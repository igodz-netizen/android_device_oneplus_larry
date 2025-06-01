#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/larry

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Configure gsi_keys.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Configure Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
ENABLE_VIRTUAL_AB := true

# Configure SDCard replacement functionality
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from holi device
$(call inherit-product, $(DEVICE_PATH)/device.mk)
$(call inherit-product, device/android/common/device.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Copy modules for depmod
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*.ko,$(DEVICE_PATH)/prebuilt,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules)

# Release name
PRODUCT_RELEASE_NAME := larry

# Assert
TARGET_OTA_ASSERT_DEVICE := larry

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := holi
PRODUCT_NAME := twrp_larry
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2467
PRODUCT_MANUFACTURER := NordCE3Lite
