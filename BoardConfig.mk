#
# Copyright (C) 2018-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm845-common
include device/xiaomi/sdm845-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/beryllium

# Assert
TARGET_OTA_ASSERT_DEVICE := beryllium

# Audio
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/beryllium.config
TARGET_KERNEL_CONFIG += vendor/xiaomi/steer.config

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67092480

# Partitions: share duplicate ext4 blocks. The retrofit super on beryllium
# (system 3 GiB + vendor 1 GiB + cust 832 MiB) is fixed in size, and a
# DerpFest build with the full GMS set overflowed it by ~371 MiB; system,
# system_ext and product are read-only, so deduplicated images are safe.
BOARD_EXT4_SHARE_DUP_BLOCKS := true

# Blobs come from the lineage-22.2 TheMuppets branch and some of them link
# against symbols whose signature changed in Android 16 (libwfdservice.so and
# AudioSystem::setDeviceConnectionState). Those symbols are provided at load
# time by shims that the executables pull in (hardware/lineage/compat), which
# the build-time ELF check cannot see.
BUILD_BROKEN_PREBUILT_ELF_FILES := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom

# Inherit from the proprietary version
include vendor/xiaomi/beryllium/BoardConfigVendor.mk
