# Maintainer: zayronxio <https://github.com/sh4nks/pkgbuilds>
# Author: zayronxio
pkgname=xfce4-appmenu-plugin
_pkgname=xfce4-appmenu-plugin
pkgver=0.10.3
pkgrel=1
pkgdesc="appmenu for xfce4-panel."
arch=('i686')
url="https://launchpad.net/~the-warl0ck-1989/+archive/xfce-appmenu-plugin/"
license=('GPL2')
depends=('xdg-utils' 'indicator-appmenu' 'libindicator' 'xfce4-panel' 'appmenu-gtk ' 'appmenu-qt')
source=(https://dl.dropboxusercontent.com/u/64881799/xfce4-appmenu-plugin_0.10-0-3_i386.tar.gz)
md5sums=('ef607a68671394f33b44626297e047a7')

package() {
	mkdir -p ${pkgdir}/usr/
    for T in *tar.gz
            do
                local FOLDER=`basename $T .tar.gz`
                mkdir $FOLDER
                bsdtar -zxf $T -C $FOLDER
            done

    cp -r */ ${pkgdir}/
}

