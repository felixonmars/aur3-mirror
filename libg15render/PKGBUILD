# Contributor: onestep_ua <onestep@ukr.net>

pkgname=libg15render
pkgver=1.2
pkgrel=3
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('libg15')
options=('!libtool')
source=(http://downloads.sourceforge.net/g15tools/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a5a2a833d098926c3d289aeae452cc53')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="${pkgdir}" install
}
