# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=nghttp2-git
pkgver=0.5.1.153.g70a8fd5
pkgrel=1
pkgdesc="An experimental implementation of Hypertext Transfer Protocol version 2.0"
arch=('i686' 'x86_64')
url="http://tatsuhiro-t.github.io/nghttp2/"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libevent' 'libxml2' 'openssl' 'spdylay' 'zlib')
makedepends=('git' 'python-sphinx')
checkdepends=('cunit')
conflicts=('nghttp2')
provides=('nghttp2' 'libnghttp2.so')
source=("git://github.com/tatsuhiro-t/nghttp2")
md5sums=('SKIP')

pkgver() {
  cd 'nghttp2'

  git describe | sed 's,-,.,g; s/^v//'
}

prepare() {
  cd 'nghttp2'

  autoreconf -fisv
}

build() {
  cd 'nghttp2'

  ./configure --prefix=/usr

  make
  make html
}

check() {
  cd 'nghttp2'

  make check
}

package() {
  cd 'nghttp2'

  make DESTDIR="$pkgdir" install

  # add MIT license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"

  # drop in wholesale generated documentation
  install -dm755 "$pkgdir/usr/share/doc"
  cp -dr --no-preserve=ownership "doc/manual" "$pkgdir/usr/share/doc/nghttp2"
}

# vim: ft=sh syn=sh et
