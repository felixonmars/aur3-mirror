# Maintainer: Xin Wang <dram.wang@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-artwork-unstable
_realname=${pkgname%-unstable}
pkgver=0.95.3
pkgrel=1
pkgdesc="Sugar gtk engine, themes and icons"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
conflicts=('sugar-artwork')
depends=('python2' 'gtk2')
makedepends=('icon-slicer' 'icon-naming-utils>=0.8.2' 'gcc' 'xorg-xcursorgen')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${_realname}/${_realname}-${pkgver}.tar.bz2)
md5sums=('a9851e533b3c05c0594e54e6789fe5f6')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  
  # python2 fix (taken from pyrss PKGBUILD)
  for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


