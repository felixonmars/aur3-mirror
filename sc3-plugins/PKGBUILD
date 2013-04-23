# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=sc3-plugins
pkgver=2012.05.26
pkgrel=1
pkgdesc="Extension plugins for the SuperCollider3 audio synthesis server."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/sc3-plugins/"
license=('GPL')
depends=("supercollider")
makedepends=('cmake')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/project/$pkgname/Source%20Release/$pkgname-src-${pkgver//./-}.tgz")
md5sums=('0e45e5e13e350e875630224c901544bd')

prepare() {
  cd "$srcdir/$pkgname-src-${pkgver//./-}"

  # find SuperCollider headers correctly
  sed -i "s|include/||" cmake_modules/FindSuperCollider3.cmake

  # solve ambiguous function call -> use sc_isnan(float x)
  sed -i "s/\(sc_isnan(\)\(unit\)/\1(float)\2/" source/TagSystemUGens/TagSystemUgens.cpp
}

build() {
  cd "$srcdir/$pkgname-src-${pkgver//./-}"

  [ -d bld ] || mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-src-${pkgver//./-}/bld"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
