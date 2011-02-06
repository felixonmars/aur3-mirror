# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=sary
pkgver=1.2.0
pkgrel=1
pkgdesc="A suffix array library and tools"
arch=("i686" "x86_64")
url="http://sary.sourceforge.net/"
license=('GPL')
depends=('glib2')
options=('!libtool')
source=(http://sary.sourceforge.net/${pkgname}-${pkgver}.tar.gz)
md5sums=('10b9a803025c5f428014a7f1ff849ecc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
