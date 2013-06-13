# Contributor: Philanecros Heliostein <philanecros@gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname='libjson-git'
pkgver=939cf1a
pkgrel=1
pkgdesc="libjson is a small C library and small codebase that packs an efficient parser and a configurable printer"
arch=('i686' 'x86_64')
url="http://projects.snarc.org/libjson/"
license=('LGPL')
source=('git+https://github.com/vincenthz/libjson.git')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/libjson"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/libjson"
  make CFLAGS:='-Wall -Os -fPIC'
}

package() {
  cd "${srcdir}/libjson"
  make DESTDIR="${pkgdir}" install
}
