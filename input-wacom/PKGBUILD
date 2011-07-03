# Maintainer:  Andrzej Giniewicz <gginiu@gmail.com>

pkgname=input-wacom
pkgver=0.11.1
pkgrel=1
pkgdesc="Kernel driver for Wacom tablets"
arch=('i686' 'x86_64')
url="http://linuxwacom.sourceforge.net/"
license=('GPL')
depends=('kernel26>=2.6.26')
makedepends=('kernel26-headers')
options=('!libtool')
source=(http://prdownloads.sourceforge.net/linuxwacom/input-wacom-${pkgver/_/-}.tar.bz2)
md5sums=('4c297d99f5be2264aa10027d1ba76adf')

build() {
  cd "${srcdir}"/input-wacom-${pkgver/_/-}
  ./configure --prefix=/usr
  make
  cd inputattach
  gcc inputattach.c -o inputattach
}

package() {
  cd "${srcdir}"/input-wacom-${pkgver/_/-}
  _ver=`uname -r | sed 's/[0-9]*\.[0-9]*\.\([0-9]*\).*/\1/'`
  if test $_ver -ge 36
  then
    _ver=2.6.36
  else
    _ver=2.6.30
  fi
  install -D -m 644 $_ver/wacom.ko "${pkgdir}"/lib/modules/$(uname -r)/updates/wacom.ko
  install -D -m 644 $_ver/wacom_w8001.ko "${pkgdir}"/lib/modules/$(uname -r)/updates/wacom_w8001.ko
  install -D -m 755 inputattach/inputattach "${pkgdir}"/usr/bin/inputattach
}

