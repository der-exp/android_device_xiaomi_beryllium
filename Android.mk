#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),beryllium)

# The retrofit super on beryllium (system 3 GiB + vendor 1 GiB + cust 832 MiB)
# is fixed in size, and a DerpFest build with the full GMS set does not fit
# even with shared ext4 blocks (~283 MiB over). Drop the Google app (Velvet,
# ~337 MiB): it is the largest single package and installs from the Play Store.
include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := Velvet
include $(BUILD_PHONY_PACKAGE)

endif
