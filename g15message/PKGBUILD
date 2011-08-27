# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=g15message
pkgver=1.0.0
pkgrel=3
pkgdesc="A simple message/alert tool for G15Daemon."
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('g15daemon')
makedepends=('gcc' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/g15daemon/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b4f5011f7a9a235061c11c5df68ae555')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
