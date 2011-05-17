# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=qr-code-creator
pkgver=1.0
pkgrel=1
pkgdesc="A tool to create QR Codes (2D barcodes)"
arch=('any')
license=('GPL3')
url="https://launchpad.net/qr-code-creator/"
depends=('qrencode' 'pygtk' 'python2')
source=(http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz)
md5sums=('2fbf97efe5d0a06d92a61da16ab6597d')

build() {
  cd ${srcdir}/${pkgname}
  #python2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${pkgname}.py
  #install files
  install -m755 -D ${pkgname}.py ${pkgdir}/usr/bin/${pkgname} || return 1
  install -m644 -D qr-code-creator.desktop ${pkgdir}/usr/share/applications/qr-code-creator.desktop || return 1
  install -m644 -D qr-code-creator.1 ${pkgdir}/usr/share/man/man1/qr-code-creator.1 || return 1
  install -m644 -D icon.png ${pkgdir}/usr/share/icons/qr-code-creator.png || return 1
}
