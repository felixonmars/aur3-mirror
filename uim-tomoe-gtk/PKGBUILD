# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=uim-tomoe-gtk
pkgver=0.6.0
pkgrel=7
pkgdesc="A Helper program for uim."
arch=('i686' 'x86_64')
url="http://tomoe.sourceforge.jp/"
license=('LGPL')
depends=('tomoe-gtk>=0.6.0' 'uim')
makedepends=('gcc' 'intltool' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/tomoe/${pkgname}-${pkgver}.tar.gz)
md5sums=('2c2573d405b9bf08c618c8dabf3b668a')

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
