# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=scim-tomoe
pkgver=0.6.0
pkgrel=7
pkgdesc="A Helper plugin for SCIM."
arch=('i686' 'x86_64')
url="http://tomoe.sourceforge.jp/"
license=('LGPL')
depends=('tomoe-gtk>=0.6.0' 'scim')
makedepends=('gcc' 'intltool' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/tomoe/${pkgname}-${pkgver}.tar.gz)
md5sums=('21207dad4ceb5c00651673ec3737e010')

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
