# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds
# This PKGBUILD is a modified file that can be found in [community]
# 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

_name=iniparser
pkgname=iniparser-legacy
pkgver=2.17
pkgrel=1
pkgdesc="A free stand-alone ini file parsing library written in portable ANSI C"
arch=('i686' 'x86_64')
url="http://ndevilla.free.fr/iniparser/"
provides=('iniparser')
conflicts=('iniparser')
license=('MIT')
source=(http://ndevilla.free.fr/iniparser/${_name}-${pkgver}.tar.gz)
md5sums=('a7425ca813c13458928b1f1012323616')

build() {
  cd ${srcdir}/${_name}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}
  install -Dm644 src/iniparser.h ${pkgdir}/usr/include/iniparser.h
  install -Dm644 src/dictionary.h ${pkgdir}/usr/include/dictionary.h
  install -Dm644 libiniparser.a ${pkgdir}/usr/lib/libiniparser.a
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/iniparser/LICENSE
}
