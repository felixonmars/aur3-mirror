# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer : Adam Walters <abwalters@abwalters.us>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
pkgname=libatomic_ops
pkgver=7.2d
pkgrel=1
pkgdesc="Provides semi-portable access to hardware provided atomic memory operations"
arch=('i686' 'x86_64')
url="https://github.com/ivmai/libatomic_ops"
license=('GPL2' 'MIT')
depends=()
options=('staticlibs')
source=(https://github.com/ivmai/libatomic_ops/archive/libatomic_ops-${pkgver//./_}.tar.gz)
md5sums=('8fb7a67a46f0d2753b7d7c2b924b7c55')

build() {
  cd ${srcdir}/libatomic_ops-libatomic_ops-${pkgver//./_}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/libatomic_ops-libatomic_ops-${pkgver//./_}
  make DESTDIR=${pkgdir} install
  install -D -m644 doc/LICENSING.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
