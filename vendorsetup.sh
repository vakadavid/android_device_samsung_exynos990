#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# For building with minimal manifest
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_BUILD_DEVICE="z3s"
export LC_ALL="C"
export FOX_VANILLA_BUILD=1
export FOX_USE_SAMSUNG_SPECIAL=1
export FOX_DYNAMIC_SAMSUNG_FIX=1
export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
export OF_DEVICE_WITHOUT_PERSIST=1
export FOX_USE_DMSETUP=1
export OF_NO_RELOAD_AFTER_DECRYPTION=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_SCREEN_H="2400"
export FOX_DELETE_AROMAFM=1
export FOX_SETTINGS_ROOT_DIRECTORY=/external_sd
export FOX_MISCELLANEOUS_ROOT_DIRECTORY=/external_sd
export FOX_BACKUP_ROOT_DIRECTORY=/external_sd
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_USE_FSCK_EROFS_BINARY=1
export FOX_VARIANT=FBEv2next
export OF_FORCE_CASEFOLDING=1
export FOX_ASH_IS_BASH=1
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=1
export OF_ALLOW_DISABLE_NAVBAR=1
export TARGET_DEVICE_ALT="z3s, z3sxxx"
export FOX_TARGET_DEVICES="z3s, z3sxxx"
export OF_USE_SYSTEM_FINGERPRINT=1
export OF_USE_TWRP_SAR_DETECT=1
export OF_DEFAULT_TIMEZONE="CET+3"
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
export OF_ENABLE_ALL_PARTITION_TOOLS=1
export FOX_USE_BUSYBOX_BINARY=1
export FOX_ENABLE_APP_MANAGER=1
export OF_STATUS_INDENT_LEFT="64"
export OF_STATUS_INDENT_RIGHT="64"
export OF_STATUS_H="88"
export OF_USE_GREEN_LED=0
export OF_SUPPORT_PRE_FLASH_SCRIPT=1
export OF_FL_PATH1="/tmp/flashlight"
        export OF_FL_PATH2=""
        export OF_FLASHLIGHT_ENABLE=1
export OF_RUN_POST_FORMAT_PROCESS=1

# Magisk
function download_magisk(){
	# Usage: download_magisk <destination_path>
	local DEST=$1
	if [ -n "${DEST}" ]; then
		if [ ! -e ${DEST} ]; then
			echo "Downloading the Latest Release of Magisk..."
			local LATEST_MAGISK_URL=$(curl -sL https://api.github.com/repos/topjohnwu/Magisk/releases/latest | grep browser_download_url | grep Magisk- | cut -d : -f 2,3 | tr -d '"')
			mkdir -p $(dirname ${DEST})
			wget -q ${LATEST_MAGISK_URL} -O ${DEST} || wget ${LATEST_MAGISK_URL} -O ${DEST}
			local RCODE=$?
			if [ "$RCODE" = "0" ]; then
				echo "Successfully Downloaded Magisk to ${DEST}!"
				echo "Done!"
			else
				echo "Failed to Download Magisk to ${DEST}!"
			fi
		fi
	fi
}
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk.zip
download_magisk $FOX_USE_SPECIFIC_MAGISK_ZIP

