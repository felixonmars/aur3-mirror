# Maintainer: zayronxio <https://github.com/sh4nks/pkgbuilds>
# Author: zayronxio
pkgname=cratos-lion-icons 
_pkgname=cratos-lion-icons
pkgver=2.0
pkgrel=3
pkgdesc="pack on icons for xfce4, that mimics the look of Apple OS X"
arch=('i686' 'x86_64')
url="http://zayronxio.blogspot.mx/2012/02/cratoslion-tema-estilo-mac-para-gnome-y.html"
license=('GPL2')
source=(https://dl.dropboxusercontent.com/u/64881799/cratos_lion-icons.tar.gz)
md5sums=('5f1c093ebebe607ed8a950fba165484d')


package() {
	mkdir -p ${pkgdir}/usr/share/icons/
    for T in *tar.gz
            do
                local FOLDER=`basename $T .tar.gz`
                mkdir $FOLDER
                bsdtar -zxf $T -C $FOLDER
            done

    cp -r */ ${pkgdir}/usr/share/icons/
}

