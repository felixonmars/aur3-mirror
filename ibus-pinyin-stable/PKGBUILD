# $Id: PKGBUILD 79511 2012-11-06 12:01:15Z arodseth $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgname=ibus-pinyin
pkgname=${_pkgname}-stable
pkgver=1.4.0
pkgrel=1
pkgdesc='Pinyin (Chinese) input method for the IBus framework, Stable version'
arch=('i686' 'x86_64')
license=('GPL')
url='http://ibus.googlecode.com'
depends=('ibus')
makedepends=('intltool')
source=("https://ibus.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('499ceb4d3bec5614f88322b8e7695c04586b63e9')
conflicts=(${_pkgname})
provides=(${_pkgname})

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i -e "s|python|python2|" setup/ibus-setup-pinyin.in

  PYTHON=python2 ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --disable-lua-extension

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
