# Maintainer: Michael Reed <m.reed [at] mykolab [dot] com>

pkgname=msgpack-c-git
pkgrel=2
pkgver=0.5.9.r287.gf6d0cd9
pkgdesc="MessagePack implementation for C and C++"
arch=('i686' 'x86_64')
url="http://msgpack.org/"
license=('Apache')
conflicts=('msgpack' 'msgpack-git')
provides=('msgpack' 'msgpack-git')
makedepends=('git')
depends=('glibc')
source=("${pkgname}::git://github.com/msgpack/msgpack-c.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/cpp-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

