# Maintainer: Alexander Monakov <amonakov@gmail.com>

pkgname=lib32-primus-git
pkgver=20130420
pkgrel=1
pkgdesc="Faster OpenGL offloading for Bumblebee (32-bit library, git sources)"
arch=('x86_64')
url="https://github.com/amonakov/primus"
license=('custom:ISC')
depends=('primus' 'lib32-mesa-libgl' 'lib32-nvidia-utils')
makedepends=('git' 'gcc-multilib')
provides=('lib32-primus')
conflicts=('lib32-primus')
source=(git://github.com/amonakov/primus.git)
sha1sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

build() {
  cd primus

  CXX=g++\ -m32 LIBDIR=lib32 make
}

package() {
  cd primus

  install -D "lib32/libGL.so.1" "$pkgdir/usr/lib32/primus/libGL.so.1"

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
