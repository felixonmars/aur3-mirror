# Maintainer: Sizhuang Liu <oldherl@gmail.com>

pkgname=fcitx4
_pkgname=fcitx
pkgver=4.0.0
_pkgver=${pkgver}_all
pkgrel=2
pkgdesc="Version 4 of fcitx, Free Chinese Input Toy of X - a Chinese IME for XIM"
arch=('i686' 'x86_64')
url="http://www.fcitx.org/"
license=('GPL')
provides=('fcitx')
conflicts=('fcitx')
depends=('pango' 'dbus-core')
makedepends=('intltool>=0.35.0')
source=("http://${_pkgname}.googlecode.com/files/${_pkgname}-${_pkgver}.tar.gz")
#md5sums=('d059623bd2d1ec00e95d27d8120ec1c8')
md5sums=('ce1156b19c719b04bd077f53fc4bd980')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
