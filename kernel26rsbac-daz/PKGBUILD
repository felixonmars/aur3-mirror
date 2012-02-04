# Maintainer: TDY <tdy@gmx.com>

pkgname=kernel26rsbac-daz
pkgver=1.4.3
  _patchset=rsbac-daz
  _kernelver=2.6.31.6
  _kernelname=linux-$_kernelver-${_patchset%-*}-$pkgver
pkgrel=1
pkgdesc="A minimal RSBAC kernel compiled with the DAZ module for an official Dazuko interface"
arch=('i686')
url="http://www.rsbac.org/"
license=('GPL')
depends=('coreutils' 'module-init-tools' 'mkinitcpio>=0.5.18')
provides=('dazuko')
backup=(boot/kconfig26$_patchset etc/mkinitcpio.d/$pkgname.preset)
install=$pkgname.install
source=(ftp://rsbac.org/download/kernels/$pkgver/${_kernelver%.*}/$_kernelname.tar.bz2
        config config.x86_64 $pkgname.preset)
md5sums=('c47326fdd5b820797d2c31ea18bcd3b3'
         '3a14bcc11708340a59fb3dca4933d64e'
         '3514ff55799e13edf2256a95b91bcba7'
         '5e25b039c75cd7a525889e04731917e5')

build() {
  _karch=x86
  _kernver=${_kernelver%.*}-$_patchset
  cd "$srcdir/$_kernelname"

#  msg "Applying -ARCH patch..."
#  patch -Np1 -i ../patch-$_kernelver-1-ARCH || return 1

  msg "Configuring kernel..."
  [ "$CARCH" = "x86_64" ] && \
    cat ../config.x86_64 > .config || cat ../config > .config
  sed -i "s/\(LOCALVERSION=\).*/\1\"-$_patchset\"/g" .config
  sed -i "s/\(KERNELRELEASE = \).*/\1$_kernver/g" Makefile
  yes "" | make config > /dev/null || return 1

  msg "Building kernel..."
  make bzImage modules || return 1
  install -dm755 "$pkgdir"/{lib/modules,boot}
  make INSTALL_MOD_PATH="$pkgdir" modules_install || return 1

  msg "Copying kernel files..."
  cp System.map "$pkgdir/boot/System.map26$_patchset"
  cp arch/$_karch/boot/bzImage "$pkgdir/boot/vmlinuz26$_patchset"
  install -Dm644 Makefile "$pkgdir/usr/src/linux-$_kernver/Makefile"
  install -Dm644 kernel/Makefile \
    "$pkgdir/usr/src/linux-$_kernver/kernel/Makefile"
  install -Dm644 .config "$pkgdir/usr/src/linux-$_kernver/.config"
  install -Dm644 .config "$pkgdir/boot/kconfig26$_patchset"

  install -dm755 "$pkgdir/usr/src/linux-$_kernver/include"
  for i in acpi asm-{generic,x86} config linux math-emu media net pcmcia scsi \
      sound video; do
    cp -a include/$i "$pkgdir/usr/src/linux-$_kernver/include/"
  done

  cp Module.symvers "$pkgdir/usr/src/linux-$_kernver/"
  cp -a scripts "$pkgdir/usr/src/linux-$_kernver/"
  chmod og-w -R "$pkgdir/usr/src/linux-$_kernver/scripts"

  install -dm755 "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/kernel"
  cp arch/$_karch/Makefile "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/"
  [ "$CARCH" = "i686" ] && cp arch/$_karch/Makefile_32.cpu \
    "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/"
  cp arch/$_karch/kernel/asm-offsets.s \
    "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/kernel/"

  msg "Copying headers..."
  msg2 "lirc"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/drivers/media/video"
  cp drivers/media/video/*.h \
    "$pkgdir/usr/src/linux-$_kernver/drivers/media/video/"
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 \
      usbvideo zc0301; do
    install -dm755 "$pkgdir/usr/src/linux-$_kernver/drivers/media/video/$i"
    cp -a drivers/media/video/$i/*.h \
      "$pkgdir/usr/src/linux-$_kernver/drivers/media/video/$i/"
  done

  msg2 "dm"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/drivers/md"
  cp drivers/md/*.h "$pkgdir/usr/src/linux-$_kernver/drivers/md/"

  msg2 "inotify.h"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/include/linux"
  cp include/linux/inotify.h "$pkgdir/usr/src/linux-$_kernver/include/linux/"

  msg2 "CLUSTERIP file for iptables"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/net/ipv4/netfilter"
  cp net/ipv4/netfilter/ipt_CLUSTERIP.c \
    "$pkgdir/usr/src/linux-$_kernver/net/ipv4/netfilter/"

  msg2 "wireless"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/net/mac80211"
  cp net/mac80211/*.h "$pkgdir/usr/src/linux-$_kernver/net/mac80211/"

  msg2 "dvb for FS#9912"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/drivers/media/dvb/dvb-core"
  cp drivers/media/dvb/dvb-core/*.h \
    "$pkgdir/usr/src/linux-$_kernver/drivers/media/dvb/dvb-core/"

  msg2 "dvb for FS#11194"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/include/config/dvb"
  cp include/config/dvb/*.h \
    "$pkgdir/usr/src/linux-$_kernver/include/config/dvb/"

  msg2 "dvb for FS#13146"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/drivers/media/dvb/frontends"
  cp drivers/media/dvb/frontends/lgdt330x.h \
    "$pkgdir/usr/src/linux-$_kernver/drivers/media/dvb/frontends/"
  cp drivers/media/video/msp3400-driver.h \
    "$pkgdir/usr/src/linux-$_kernver/drivers/media/dvb/frontends/"

  msg2 "xfs and shmem for aufs building"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/fs/xfs"
  install -dm755 "$pkgdir/usr/src/linux-$_kernver/mm"
  cp fs/xfs/xfs_sb.h "$pkgdir/usr/src/linux-$_kernver/fs/xfs/"

  msg2 "virtualbox for FS#14568"
  cp -a include/drm "$pkgdir/usr/src/linux-$_kernver/include/"

  msg2 "broadcom wl for FS#14568"
  cp -a include/trace "$pkgdir/usr/src/linux-$_kernver/include/"

  msg2 "vmlinux"
  cp vmlinux "$pkgdir/usr/src/linux-$_kernver/"

  msg "Copying Kconfigs..."
  for i in $(find . -name "Kconfig*"); do 
    install -dm755 "$pkgdir/usr/src/linux-$_kernver/$(echo $i | sed 's#/Kconfig.*##')"
    cp $i "$pkgdir/usr/src/linux-$_kernver/$i"
  done

  cd "$pkgdir/usr/src/linux-$_kernver/include" && \
    ln -s asm-$_karch asm
  chown -R root.root "$pkgdir/usr/src/linux-$_kernver"
  find "$pkgdir/usr/src/linux-$_kernver" -type d -exec chmod 755 '{}' \;
  cd "$pkgdir/lib/modules/$_kernver" && \
    (rm -f source build; ln -sf ../../../usr/src/linux-$_kernver build)

  msg "Preparing install script..."
  sed -i "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g; \
          s/RSBAC_VERSION=.*/RSBAC_VERSION=$pkgver/g" "$startdir/$install"
  sed -i "s/LOCAL_VERSION=.*/LOCAL_VERSION=$_patchset/g" \
    "$startdir/$install" "$srcdir/$pkgname.preset"

  msg "Installing mkinitcpio preset..."
  install -Dm644 "$srcdir/$pkgname.preset" \
    "$pkgdir/etc/mkinitcpio.d/$pkgname.preset" || return 1
  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='$_kernver'" \
    > "$pkgdir/etc/mkinitcpio.d/$pkgname.kver"

  msg "Purging unneeded architectures..."
  find "$pkgdir/usr/src/linux-$_kernver/arch"/* -maxdepth 0 -type d \
    ! -name "$_karch" -exec rm -rf '{}' \;

  msg "Removing firmware..."
  rm -rf "$pkgdir/lib/firmware"
}
