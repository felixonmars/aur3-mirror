# Contributor: Damnshock <damnshock@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=toshset
pkgver=1.76
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A command-line tool allowing access to much of the Toshiba hardware interface"
url="http://www.schwieters.org/toshset"
license=('GPL')
source=("http://www.schwieters.org/${pkgname}/${pkgname}.tgz"
	'fix-makefile.patch'
	'fix-ftbfs-gcc-4.7.patch')
md5sums=('195b96388c8bf044144fed0fdbc3bbf1'
	'eb26ffee10a5473d5dfee1768cd4b2df'
	'e5a267c512dad65d4b3febd86f8ce7bd')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Np1 -i ${srcdir}/fix-makefile.patch 
  patch -Np1 -i ${srcdir}/fix-ftbfs-gcc-4.7.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
