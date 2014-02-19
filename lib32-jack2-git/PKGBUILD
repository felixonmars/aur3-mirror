# Maintainer: farwayer <farwayer@gmail.com>

pkgname=lib32-jack2-git
pkgver=1.9.9.5.241.g5eaeab8
pkgrel=2
pkgdesc='Jack2: 32-bit libs'
arch=('x86_64')
url='http://jackaudio.org/'
license=('GPL2')
depends=('jack2-git')
makedepends=('python' 'git' 'gcc-multilib' 'lib32-celt' 'lib32-opus')
optdepends=()
provides=('lib32-jack2')
conflicts=('lib32-jack2' 'lib32-jack')
source=($pkgname::git+http://github.com/jackaudio/jack2.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd $pkgname

  ./waf configure --mixed --clients=128 --ports-per-application=1536 
  ./waf $MAKEFLAGS build
}

package() {
  cd $pkgname

  mkdir -p "$pkgdir/usr/lib32"
  cp -P build/lib32/common/libjack.so* "$pkgdir/usr/lib32"
}
