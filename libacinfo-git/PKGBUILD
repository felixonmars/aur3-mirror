# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: mmm
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
_pkgname=libacinfo
pkgname=$_pkgname-git
pkgver=0d0f1da
pkgrel=1
pkgdesc="library implements a generic and easy interface for Aqua Computer (AC) USB devices"
arch=('i686' 'x86_64')
url="https://github.com/darkscout/libacinfo"
license=('LGPL3')
depends=('libxml2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+https://github.com/darkscout/libacinfo.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/libacinfo
  git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/libacinfo
  make
}

package() {
  mkdir -p $pkgdir/usr/lib
  mkdir $pkgdir/usr/bin
  install -Dm755 $srcdir/libacinfo/bin/acinfo  $pkgdir/usr/bin/
  install -Dm755 $srcdir/libacinfo/bin/libacinfo.so $pkgdir/usr/lib
}

# vim:set ts=2 sw=2 et:
