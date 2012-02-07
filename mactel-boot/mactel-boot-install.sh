#!/bin/bash

## Execute as root

_HFS_PLUS_PART_MP="${1}"

if [[ -z "${1}" ]]; then
	echo
	echo "Usage: ${0} <HFS_PLUS_PARTITION_MOUNTPOINT>"
	echo
	echo "Example: ${0} /boot/mactel"
	echo
	exit 0
fi

### check for root
if ! [[ ${UID} -eq 0 ]]; then 
	echo "ERROR: Please run as root user!"
	exit 1
fi

set -x -e

if [[ "$(df -T "${_HFS_PLUS_PART_MP}" | tail -n +2 | awk '{print $2}')" == "hfsplus" ]]; then
	
	echo
	
	mkdir -p "${_HFS_PLUS_PART_MP}/System/Library/CoreServices"
	cp "/usr/share/mactel-boot/SystemVersion.plist" "${_HFS_PLUS_PART_MP}/System/Library/CoreServices/SystemVersion.plist"
	
	echo
	
	echo "This file is required for booting" > "${_HFS_PLUS_PART_MP}/mach_kernel"
	
	touch "${_HFS_PLUS_PART_MP}/System/Library/CoreServices/boot.efi"
	touch "${_HFS_PLUS_PART_MP}/.VolumeIcon.icns"
	
	echo
	
	hfs-bless "${_HFS_PLUS_PART_MP}" "${_HFS_PLUS_PART_MP}/System/Library/CoreServices" "${_HFS_PLUS_PART_MP}/System/Library/CoreServices/boot.efi"
	
	echo
else
	echo
	echo "${_HFS_PLUS_PART_MP} is not an HFS PLUS Partition Mountpoint"
	echo
fi

set +x +e

unset _HFS_PLUS_PART_MP
