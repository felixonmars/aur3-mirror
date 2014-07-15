#!/bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=linux-manga-downloader
pkgver=0.7EOL
pkgrel=1
pkgdesc="End Of Life, install Mangatux"
arch=('any')
url="http://code.google.com/p/${pkgname}/"
url="https://github.com/jorge-barroso/mangatux/tree/master"
license=('GPL3')
depends=('libnotify' 'gtkdialog' 'wget' 'links' 'zenity')
install=LMD.install
source=(https://github.com/jorge-barroso/mangatux/archive/master.zip)
provides=(mangatux)
package() {

#Creating Directories

install -m755 -d ${pkgdir}/usr/bin/
install -m755 -d ${pkgdir}/usr/share/{applications,doc/mtx,icons,mtx/langs}

#Installing
    
install -m755 ${srcdir}/Mangatux-master/usr/bin/*						${pkgdir}/usr/bin/
install -m755 ${srcdir}/Mangatux-master/usr/share/applications/Mangatux.desktop 		${pkgdir}/usr/share/applications/Mangatux.desktop
install -m755 ${srcdir}/Mangatux-master/usr/share/icons/pen.png 					${pkgdir}/usr/share/icons/pen.png
install -m755 ${srcdir}/Mangatux-master/usr/share/mtx/langs/ca_CA 					${pkgdir}/usr/share/mtx/langs/ca_CA
install -m755 ${srcdir}/Mangatux-master/usr/share/mtx/langs/es_ES 					${pkgdir}/usr/share/mtx/langs/es_ES
install -m755 ${srcdir}/Mangatux-master/usr/share/mtx/langs/en_EN 					${pkgdir}/usr/share/mtx/langs/en_EN

}

# vim:set ts=2 sw=2 et:

sha512sums=('27142efda1fecaa67af0b8c10c99937274fc8e923fbfed8b3c66f879efa21cbac9205d4d690b491a0ac40fcc463f1f492d1524df4aa7e1e0d9e5564cffef00fb')
