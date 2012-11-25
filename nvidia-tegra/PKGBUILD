# Maintainer: Fly-away <Flyaaway@gmail.com>

# NVidia Tegra HardFP drivers, release 16
# Do not distribute these extensively or expect any support

buildarch=4

pkgname=('nvidia-tegra')
pkgver=16.2.0
pkgrel=3
arch=(armv7h)
replaces=('nvidia-trimslice')
conflicts=('nvidia-trimslice')
license=('GPL')
url="http://archlinuxarm.org"
source=('http://developer.download.nvidia.com/akamai/mobile/files/L4T/ventana_Tegra-Linux-R16.2.0_armhf.tbz2'
        'http://developer.download.nvidia.com/akamai/mobile/files/L4T/ventana_Tegra-Linux-codecs-R16.2.0_armhf.tbz2'
	'61-tegra-gpu.conf'
	'69-tegra-gpu.rules')
sha1sums=('6c5d9744c8737c69498dd0211f24d40b03b37802'
          '4fffdf97e8a6e789ff507f7ab4db7288e480ad29'
          'ca881604d54df7bed80cedee18ca6f0b76619e18'
          '0c24895bacd02a170f968bb3342b8c7d654a7f36')
options=('!distcc' '!ccache' '!strip')
depends=('pcre')

package() {
  pkgdesc="Nvidia drivers for the Tegra2"
  nvlibpath="/usr/lib/nvidia-tegra" 
 
  cd ${srcdir}

  tar xf restricted_codecs.tbz2 -C ${pkgdir}
  tar xf Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2 -C ${pkgdir}
  tar xf Linux_for_Tegra/nv_tegra/nv_sample_apps/nvgstapps.tbz2 -C ${pkgdir}

  cd ${pkgdir}
  rm -rf etc
  mkdir -p etc/X11/xorg.conf.d etc/ld.so.conf.d usr/lib/udev/rules.d ${pkgdir}/${nvlibpath}
  cp ${srcdir}/61-tegra-gpu.conf etc/X11/xorg.conf.d/
  cp ${srcdir}/69-tegra-gpu.rules usr/lib/udev/rules.d/
  echo "${nvlibpath}" > etc/ld.so.conf.d/${pkgname}.conf

  cd usr/lib
  ln -s libEGL.so.1 libEGL.so
  ln -s libGLESv2.so.2 libGLESv2.so
  ln -s libGLESv1_CM.so.1 libGLESv1_CM.so

  find . -maxdepth 1 ! -type d  -exec mv {} ${pkgdir}/${nvlibpath} \;
  find xorg -type d -exec chmod 755 {} \;  

  # links for nvgstplayer
  ln -s libpcre.so libpcre.so.3
  ln -s libpcreposix.so libpcreposix.so.3

  cd xorg/modules/drivers/
  rm -f tegra_drv.abi{{5..8},{10..12}}.so
  ln -s tegra_drv.abi13.so tegra_drv.so

  cd ${pkgdir}

  mv lib/firmware usr/lib/
  rm -rf lib
}
