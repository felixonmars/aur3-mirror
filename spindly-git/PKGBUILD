# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=spindly-git
pkgver=r303.90dd687
pkgrel=1
pkgdesc="a portable C library for SPDY transport"
arch=('i686' 'x86_64')
url="http://github.com/bagder/spindly"
license=('MIT')
depends=('glibc')
makedepends=('git')
conflicts=('spindly')
provides=('spindly')
source=("git://github.com/bagder/spindly.git")
md5sums=('SKIP')

pkgver() {
  cd spindly

  printf 'r%s.%s' "$(git rev-list master | wc -l)" "$(git describe --always)"
}

build() {
  cd spindly

  ./buildconf
  ./configure --prefix=/usr
  make
}

package() {
  make -C spindly DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
