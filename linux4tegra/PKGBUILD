pkgname=linux4tegra
pkgver=R16.2
pkgrel=1
arch=(arm armv7h)
url="http://developer.nvidia.com/linux-tegra"
license=(custom)
options=(!strip)
pkgdesc="drivers and codecs for nvidia tegra platform"

platform=ventana # ventana / cardhu
xabi=13 #5..13

source=("http://developer.download.nvidia.com/akamai/mobile/files/L4T/${platform}_Tegra-Linux-codecs-R16.2.0_armhf.tbz2"
        "http://developer.download.nvidia.com/akamai/mobile/files/L4T/${platform}_Tegra-Linux-R16.2.0_armhf.tbz2")
md5sums=('5ca5254f1a55267d2c12d847d2ca58f6'
         '5224c58fb1c7ed047d54ff1ac281c158')

package() {
  #mkdir -p ${pkgdir}/usr/share/{licenses,doc}/${pkgname}/

  # drivers
  tar xaf $srcdir/Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2 -C $pkgdir
  rm -rf $pkgdir/etc/nv_tegra_release
  ln -s $pkgdir/usr/lib/xorg/modules/drivers/tegra_drv.abi${xabi}.so $pkgdir/usr/lib/xorg/modules/drivers/tegra_drv.so
  #mv $pkgdir/usr/lib/xorg/modules/drivers/tegra_drv.abi${xabi}.so $pkgdir/usr/lib/xorg/modules/drivers/tegra_drv.so
  #rm $pkgdir/usr/lib/xorg/modules/drivers/tegra_drv.abi*
  install -D -m644 ${srcdir}/Linux_for_Tegra/nv_tegra/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # codecs
  tar xaf $srcdir/restricted_codecs.tbz2 -C $pkgdir
  install -D -m644 "${srcdir}/Tegra_Software_License_Agreement-Tegra-Linux-codecs.txt" "${pkgdir}/usr/share/licenses/${pkgname}/codecs_agreement.txt"

  # configs
  tar xaf $srcdir/Linux_for_Tegra/nv_tegra/config.tbz2 -C $pkgdir
  mkdir $pkgdir/etc/X11/xorg.conf.d
  mv $pkgdir/etc/X11/xorg.conf $pkgdir/etc/X11/xorg.conf.d/10-tegra.conf
  rm -rf $pkgdir/etc/{wpa_supplicant.conf,init}
  
  # inittab: ttyS0
  # power state
  #if [ -e /sys/power/state ]; then chmod 0666 /sys/power/state; fi
  # lp2 idle state
  #if [ -e /sys/module/cpuidle/parameters/lp2_in_idle ] ; then echo "Y" > /sys/module/cpuidle/parameters/lp2_in_idle; fi
  # mmc read ahead size
  #if [ -e /sys/block/mmcblk0/queue/read_ahead_kb ]; then echo 2048 > /sys/block/mmcblk0/queue/read_ahead_kb; fi
  #if [ -e /sys/block/mmcblk1/queue/read_ahead_kb ]; then echo 2048 > /sys/block/mmcblk1/queue/read_ahead_kb; fi

  # nvgstapps
  tar xaf "${srcdir}/Linux_for_Tegra/nv_tegra/nv_sample_apps/nvgstapps.tbz2" -C $pkgdir
  install -D -m644 "${srcdir}/Linux_for_Tegra/nv_tegra/nv_sample_apps/LICENSE.gst-openmax" "${pkgdir}/usr/share/licenses/${pkgname}/license_gst-openmax.txt"
  install -D -m644 "${srcdir}/Linux_for_Tegra/nv_tegra/nv_sample_apps/nvgstcapture_README.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.nvgstcapture.txt"
  install -D -m644 "${srcdir}/Linux_for_Tegra/nv_tegra/nv_sample_apps/nvgstplayer_README.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.nvgstplayer.txt"
}
