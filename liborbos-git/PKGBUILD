# Maintainer: Zatherz <zatherz[at]linux[dot]com>
pkgbase=liborbos-git
pkgname=('liborbos-math-git' 'liborbos-text-git' 'liborbos-string-git')
pkgver=r0.g1acd7be
pkgrel=1
pkgdesc="Collection of useful libraries made for Orbos' C programs."
url="http://zatherz.github.io/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
makedepends=('git' 'make')
source=("git://github.com/Zatherz/liborbos")
md5sums=("SKIP")

pkgver() {
  cd "liborbos"
  git describe --long --all | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/heads\/master.//g'
}

build() {
  cd "$srcdir/liborbos/liborbos-math"
  make
  cd "$srcdir/liborbos/liborbos-text"
  make
  cd "$srcdir/liborbos/liborbos-string"
  make
}

package_liborbos-math-git() {
  provides=('liborbos-math')
  conflicts=('liborbos-math')
  pkgdesc="Math library from LibOrbos set"
  cd "$srcdir/liborbos/liborbos-math"
  make DESTDIR="$pkgdir" install
}

package_liborbos-text-git() {
  provides=('liborbos-text')
  conflicts=('liborbos-text')
  pkgdesc="Text library from LibOrbos set"
  cd "$srcdir/liborbos/liborbos-text"
  make DESTDIR="$pkgdir" install
}

package_liborbos-string-git() {
  provides=('liborbos-string')
  conflicts=('liborbos-string')
  pkgdesc="Dynamic string library from LibOrbos set"
  cd "$srcdir/liborbos/liborbos-string"
  make DESTDIR="$pkgdir" install
}
