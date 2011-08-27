# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=tentun
pkgver=1.0
pkgrel=4
pkgdesc="Modifies packet traffic making existing streams of data completely transparent."
arch=('i686' 'x86_64')
url="http://tentun.sourceforge.net/"
license=('GPL')
depends=('libdnet' 'libpcap' 'lzo' 'openssl')
makedepends=('gcc' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dd5440475c0c2e716d2ecde8ad5c67c9')

build() {
  cd ${srcdir}/tunnel

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/tunnel

  make DESTDIR=${pkgdir} install || return 1
}
