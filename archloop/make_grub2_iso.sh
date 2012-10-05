#!/bin/bash


BOOT="grub2"
IMG_TYPE="iso"
APPNAME=${0}
IMGROOT=$1
QUIET="n"
AUTHOR="GunsNRose"
CDNAME="archlive"
CUR_DATETIME="$(date +%Y%m%d)"
IMGNAME="archlinux_livecd_${CUR_DATETIME}.iso"
GRUB_TARGET_DIR="boot/grub/i386-pc"
LOG="mkiso.log"

USE_UDF="0"

#GENERATE_FORMAT="i386-coreboot"
GENERATE_FORMAT="i386-pc"
#pc 
GRUB2_MOD="biosdisk part_gpt iso9660 fat ntfs ext2 pxe reiserfs gfxterm ntfs"


function msg2()
{
    echo -e "$@"
}
function usage()
{
    echo "help"
}
function green()
{
    echo -e "$@"
}
function error()
{
    echo -e "$@"
    exit 1
}


isohybrid_cmd=$(type -p isohybrid)

mkisofs_version=$(mkisofs --version | head -1| cut -d " " -f2)
[ "x${mkisofs_version}" = "x" ] && (error "宿主系统没有mkisofs程序，请先安装cdrkit" && exit 1)

function create_grub2_iso()
{
    if [ "$BOOT" = "grub2" ]; then
	[ ! -d ${IMGROOT}/boot/grub ] && mkdir -p ${IMGROOT}/boot/grub
	#grub2_mkimg=$(find $MODULEDIR -type f -name "grub-mkimage")
    grub2_mkimg=$(type -p grub-mkimage)
	if [ "x${grub2_mkimg}" = "x" ]; then
		if [ ! -x /bin/grub-mkimage ]; then
			error "目标系统及宿主系统中都没有安装grub2，\n 宿主系统安装grub2后再 sudo \
				sh ./$APPNAME img 工作目录 来重新制作镜像。" | tee -a ${LOG}
			usage 1
		fi
		grub2_mkimg="/bin/grub-mkimage"
        mkdir -pv ${IMGROOT}/boot/grub/
		cp -fr /usr/lib/grub/i386-pc/ ${IMGROOT}/boot/grub/
		cp -fr /usr/share/grub/* ${IMGROOT}/boot/grub/
	else
        #error "xxxxxxxxxxxxxxxxx"
        mkdir -pv ${IMGROOT}/boot/grub/
		cp -fr /usr/lib/grub/i386-pc/ ${IMGROOT}/boot/grub/
		cp -fr /usr/share/grub/* ${IMGROOT}/boot/grub/

		#echo cp -f $(find $MODULEDIR -type d -name "i386-pc")/* ${IMGROOT}/boot/grub/
		#echo cp -f $(find $MODULEDIR -type f -name "*.pf2") ${IMGROOT}/boot/grub/
	fi
    CORE_OUTPUT_FILE="/tmp/core.img"
    rm -f ${CORE_OUTPUT_FILE}
	GRUB2_MKIMG_CMD="${grub2_mkimg} -d ${IMGROOT}/${GRUB_TARGET_DIR} --format=${GENERATE_FORMAT} -o ${CORE_OUTPUT_FILE} ${GRUB2_MOD}"
    ${GRUB2_MKIMG_CMD}
    if [ $? -ne 0 ] ; then
        green "${GRUB2_MKIMG_CMD}"
        error "制作生成 grub2 core.img 失败"
    fi
	#cat ${IMGROOT}/boot/grub/i386-pc/{cdboot.img,core.img} > ${IMGROOT}/boot/grub/grub2cd.bin
    if [ ! -e ${IMGROOT}/boot/grub/i386-pc/cdboot.img ] ; then
        error "生成 ${CORE_OUTPUT_FILE} 失败"
    fi
    cat ${IMGROOT}/boot/grub/i386-pc/cdboot.img ${CORE_OUTPUT_FILE} > ${IMGROOT}/boot/grub/grub2cd.bin
	bootflags="-b boot/grub/grub2cd.bin"
	green "引导程序 $BOOT 准备完毕." | tee -a ${LOG}
   fi

   if [ "$IMG_TYPE" = "iso" ]; then
        CP_PROGRAM=$(type -P cp)
        ${CP_PROGRAM} -av $0 "${IMGROOT}/"
        msg2 "基于目录 ${IMGROOT} 使用 mkisofs v${mkisofs_version} 来创建 ISO 镜像，请稍后..." | tee -a ${LOG}
        qflag=""
        [ "${QUIET}" = "y" ] && qflag="-quiet"
        if [ "x${USE_UDF}" = "x1" ] ; then
            error "count't use udf"
        mkisofs ${qflag} -J -R -D -r -l $bootflags -uid 0 -gid 0 \
		-udf \
		-allow-limited-size \
		-input-charset utf-8 -p "${AUTHOR}" \
            -no-emul-boot -boot-load-size 4 -boot-info-table \
            -publisher "${PUBLISHER}" -log-file /tmp/archlive_img.log \
            -A "${CDNAME}" -V "${CDNAME}" \
            -o "${IMGNAME}" "${IMGROOT}"
        else
        #mkisofs ${qflag} -J -R -D -r -l $bootflags -uid 0 -gid 0 
        mkisofs ${qflag} -R -D -r -l $bootflags -uid 0 -gid 0 \
		-allow-limited-size \
		-input-charset utf-8 -p "${AUTHOR}" \
            -no-emul-boot -boot-load-size 4 -boot-info-table \
            -publisher "${PUBLISHER}" -log-file /tmp/archlive_img.log \
            -A "${CDNAME}" -V "${CDNAME}" \
            -o "${IMGNAME}" "${IMGROOT}"
        fi

        if [ $? -eq 0 ]; then
		echo "${isohybrid_cmd} "${IMGNAME}" 2>&1 >>${LOG}"
		md5sum "${IMGNAME}" > "${IMGNAME}".md5
		sha1sum "${IMGNAME}" > "${IMGNAME}".sha1
		iso_size=$(isosize ${IMGNAME} 2>/dev/null)
		if [ "x${iso_size}" = "x" ]; then
			iso_size=$(grep " MB" /tmp/archlive_img.log | sed 's|.*(\(.*cat ${PKGFILE} | sort > ${IMGROOT}/${CDNAME}/${CDNAME}.listMB\))|\1|')
		fi 
		cat /tmp/archlive_img.log >>${LOG}
		rm -f /tmp/archlive_img.log
		green "${IMGNAME}制作成功，大小 ${iso_size}。" | tee -a ${LOG}
        fi
   fi
}

create_grub2_iso
#sudo mksquashfs x86_64_iso_rootfs x86_64_iso_dir/x86_64.sf -noappend -comp lzo
