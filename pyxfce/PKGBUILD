# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
pkgname=pyxfce
pkgver=4.4.0
pkgrel=1
pkgdesc="Python wrapper for XFCE"
arch=('i686' 'x86_64')
url="http://pyxfce.xfce.org"
license=('pyxfce')
source=(http://pyxfce.xfce.org/${pkgname}-${pkgver}.tar.gz)
depends=('libxfcegui4>=4.3.90' 'xfce-mcs-manager>=4.1.0' 'xfce4-panel>=4.3.17' 'xfce-utils>=4.1.0')
makedepends=('libxfcegui4>=4.3.90' 'libxfce4mcs>=4.1.0' 'libxfce4util>=4.1.0')
md5sums=('5f9ac63908adc9eaf9eb3e3b2d41167b')

build() {
   cd ${startdir}/src/${pkgname}-${pkgver}
   ./configure --prefix=/usr || return 1

   make || return 1

   make install DESTDIR=$startdir/pkg
}
