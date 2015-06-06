# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=libdrm-armada
pkgver=0.1
pkgrel=1
pkgdesc="Marvell Armada libdrm buffer object management module"
arch=('armv7h' 'i686' 'x86_64')
url="http://ftp.arm.linux.org.uk/cgit/libdrm-armada.git/"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'sed')
source=("git+http://ftp.arm.linux.org.uk/cgit/libdrm-armada.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  libtoolize --force
  aclocal
  automake --force-missing --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
