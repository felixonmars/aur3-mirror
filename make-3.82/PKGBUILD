# Maintainer: Stian Øterhaug <stian.osterhaug@gmail.com>

pkgname=make-3.82
pkgver=3.82
pkgrel=1
pkgdesc="GNU make utility to maintain groups of programs (3.82 version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/make"
license=('GPL')
depends=('glibc' 'sh')
install=$pkgname.install
source=(http://ftp.gnu.org/gnu/make/${pkgname}.tar.bz2)
md5sums=('1a11100f3c63fcf5753818e59d63088f')

build() {
  cd ${srcdir}/${pkgname}
  ./configure --prefix=/usr --program-suffix=-$pkgver
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install-exec
}
