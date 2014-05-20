# Copyright Statement:
#
# This software/firmware and related documentation ("MediaTek Software") are
# protected under relevant copyright laws. The information contained herein
# is confidential and proprietary to MediaTek Inc. and/or its licensors.
# Without the prior written permission of MediaTek inc. and/or its licensors,
# any reproduction, modification, use or disclosure of MediaTek Software,
# and information contained herein, in whole or in part, shall be strictly prohibited.

# MediaTek Inc. (C) 2010. All rights reserved.
#
# BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
# THAT THE SOFTWARE/FIRMWARE AND ITS DOCUMENTATIONS ("MEDIATEK SOFTWARE")
# RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES ARE PROVIDED TO RECEIVER ON
# AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
# NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
# SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
# SUPPLIED WITH THE MEDIATEK SOFTWARE, AND RECEIVER AGREES TO LOOK ONLY TO SUCH
# THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. RECEIVER EXPRESSLY ACKNOWLEDGES
# THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES
# CONTAINED IN MEDIATEK SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK
# SOFTWARE RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
# STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND
# CUMULATIVE LIABILITY WITH RESPECT TO THE MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
# AT MEDIATEK'S OPTION, TO REVISE OR REPLACE THE MEDIATEK SOFTWARE AT ISSUE,
# OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY RECEIVER TO
# MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
#
# The following software/firmware and/or related documentation ("MediaTek Software")
# have been modified by MediaTek Inc. All revisions are subject to any receiver's
# applicable license agreements with MediaTek Inc.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

commands_factory_local_path := $(LOCAL_PATH)

CORE_SRC_FILES := \
	src/imei.c 
    
LOCAL_SRC_FILES := \
	$(CORE_SRC_FILES)

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/inc/ \
	mediatek/custom/$(TARGET_PRODUCT)/cgen/inc/ \
	mediatek/external/nvram/libnvram/ \
	mediatek/custom/$(TARGET_PRODUCT)/cgen/cfgdefault/ \
	mediatek/custom/$(TARGET_PRODUCT)/cgen/cfgfileinc/ \
	$(MTK_ROOT_CUSTOM_OUT)/kernel/dct \
    mediatek/custom/$(TARGET_PRODUCT)/cgen/cfgdefault/ \
    mediatek/custom/$(TARGET_PRODUCT)/cgen/cfgfileinc/ \
    mediatek/external/nvram/libfile_op



LOCAL_MODULE := imei
# Add to fix Android 2.3 build error, and need to add factory to user_tags.mk for user build
LOCAL_MODULE_TAGS :=  optional

LOCAL_STATIC_LIBRARIES :=
LOCAL_STATIC_LIBRARIES += libminzip libunz libmtdutil libmincrypt libm
LOCAL_STATIC_LIBRARIES += libminiui libpixelflinger_static libpng libz libcutils
LOCAL_STATIC_LIBRARIES += libstdc++ libc 


ifneq ($(filter $(strip $(MTK_PLATFORM)),MT6572 MT6589 MT6582),)

ifeq ($(strip $(MTK_PLATFORM)),MT6589)
LOCAL_SHARED_LIBRARIES := libc libcutils libnvram libdl libhwm libaudiocustparam libext4_utils libacdk libfeatureio liblog libdpframework libdpframework_plat libdpframework_os libutils libmmfactoryutil libandroid_runtime libnativehelper libfile_op
endif

ifeq ($(strip $(MTK_PLATFORM)),MT6572)
LOCAL_SHARED_LIBRARIES := libc libcutils libnvram libdl libhwm libaudiocustparam libext4_utils libacdk libfeatureio liblog libdpframework libutils libmmfactoryutil libandroid_runtime libnativehelper libfile_op
endif

ifeq ($(strip $(MTK_PLATFORM)),MT6582)
LOCAL_SHARED_LIBRARIES := libc libcutils libnvram libdl libhwm libaudiocustparam libext4_utils libacdk libfeatureio liblog libdpframework libutils libmmfactoryutil libandroid_runtime libnativehelper libfile_op
endif

else
LOCAL_SHARED_LIBRARIES:= libc libcutils libmedia libhardware_legacy libaudioflinger libhwm libacdk libcameracustom libnvram libdl libmhal libfile_op
endif

ifeq ($(MTK_PLATFORM),MT6573)
LOCAL_CFLAGS += -DMT6573
endif
ifeq ($(MTK_PLATFORM),MT6575)
LOCAL_CFLAGS += -DMT6575
endif
ifeq ($(MTK_PLATFORM),MT6577)
LOCAL_CFLAGS += -DMT6577
endif
ifeq ($(MTK_PLATFORM),MT6572)
LOCAL_CFLAGS += -DMT6572
endif
ifeq ($(MTK_PLATFORM),MT6582)
LOCAL_CFLAGS += -DMT6582
endif
ifeq ($(MTK_PLATFORM),MT6589)
LOCAL_CFLAGS += -DMT6589
endif

include $(BUILD_EXECUTABLE) 
##################################################################
