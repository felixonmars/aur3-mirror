# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=tomoe-gtk
pkgver=0.6.0
pkgrel=7
pkgdesc="Provides a gui widgets library to the handwriting recognition engine."
arch=('i686' 'x86_64')
url="http://tomoe.sourceforge.jp/"
license=('LGPL')
depends=('tomoe>=0.6.0')
makedepends=('gcc' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/tomoe/${pkgname}-${pkgver}.tar.gz)
md5sums=('bd49ac64549d8a7ab092bea1c1dc04fc')

build() { 
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure PYTHON=python2 --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static \
	      --without-gucharmap

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
