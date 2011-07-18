# Maintainer: Guillaume ALAUX <Guillaume at ALAUX dot net>
pkgname=em28xx-new-hg
pkgver=1
pkgrel=3
pkgdesc="A new module for em28xx and drxd devices(dvb-t and analogic tv tested and working)"
url="http://www.red-blue.it/guide/pinnacle-pctv-hybrid-pro-stick-330e-su-maverick.html"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://dl.dropbox.com/u/8000292/drxd-firmware.tar
        http://dl.dropbox.com/u/8000292/HVR900r2_2_6_35.tar.bz2)
md5sums=('dfefefb7a3bb016f0f4492c321338d09'
         '1ace9d9381c9a7ce344f08b51c2c3166')
install=(${pkgname}.install)

build() {
    cd "${srcdir}"
    mkdir -p ${pkgdir}/lib/firmware
    cp drxd-firmware/*.fw ${pkgdir}/lib/firmware
    cd HVR*/
    make -i 
}

package() {
    cd "${srcdir}"

    _KERNELS=$(pacman -Ql kernel26 | grep /modules.alias.bin | sed 's/kernel26.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g')
  
    mkdir -p ${pkgdir}/${_KERNELS}/kernel/drivers/media
   
    mkdir -p ${pkgdir}/${_KERNELS}/kernel/drivers/media/dvb/frontends 
    mkdir -p ${pkgdir}/${_KERNELS}/kernel/drivers/media/video/em28xx
    cp -n em28xx*.ko ${pkgdir}/${_KERNELS}/kernel/drivers/media/video/em28xx 
    cp -n drxd.ko ${pkgdir}/${_KERNELS}/kernel/drivers/media/dvb/frontends 
}
