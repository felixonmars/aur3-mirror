 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=kernel-headers-musl-git
pkgver=49.245b8d9
pkgrel=1
pkgdesc="Linux kernel headers sanitized for use with musl libc"
arch=('i686' 'x86_64')
url="https://github.com/sabotage-linux/kernel-headers"
license=('LGPL')
depends=('musl')
makedepends=('git')
source=('headers'::'git://github.com/sabotage-linux/kernel-headers')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/headers
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


#build() {
#  make
#}

package() {
  cd $srcdir/headers
  make ARCH=$CARCH prefix=/usr/lib/musl DESTDIR=$pkgdir install
}
 
