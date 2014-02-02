# Maintainer: <kfgz at interia dot pl>

pkgname=findemall
pkgver=1.3
pkgrel=2
pkgdesc="Another graphical find-and-grep tool"
arch=('i686' 'x86_64')
url="http://findemall.sourceforge.net/"
license=('GPL')
install=${pkgname}.install
depends=('python2-pmw>=1.2' 'tk>2.3' 'tktreectrl>2.1' 'tkinter-treectrl>=0.6')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2/download
        ${pkgname}.desktop
        install)
md5sums=('5a2c4cc76e784bee247665b16f6825fe'
         'cd51914b3c5b69336b9fcf2fb7098cce'
         '1ac517c93163cfa980a9f4c27bdb65f4')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -m755 "${srcdir}"/install "${srcdir}"/${pkgname}-${pkgver}
  ./install
}

package() {
  install -D -m644 "${srcdir}"/${pkgname}.desktop \
                   "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -dm755 "${pkgdir}"/usr/share/${pkgname}-${pkgver}
  cp -ar "${srcdir}"/${pkgname}-${pkgver}/* "${pkgdir}"/usr/share/${pkgname}-${pkgver}/
  rm "${pkgdir}"/usr/share/${pkgname}-${pkgver}/install
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|g" "${pkgdir}"/usr/share/${pkgname}-${pkgver}/findemall.py
}
