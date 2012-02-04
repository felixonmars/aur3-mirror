# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
_pkgbasename=gtkglextmm
pkgname=lib32-$_pkgbasename
pkgver=1.2.0
pkgrel=5
pkgdesc="Cpp C++ bindings for gtkglext (32 bit)"
arch=('x86_64')
url="http://gtkglext.sourceforge.net/"
license=('GPL')
depends=('lib32-gtkmm' 'lib32-gtkglext' "$_pkgbasename")
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/gtkglext/${_pkgbasename}-${pkgver}.tar.bz2"
	'gdkspanfunc.patch')
md5sums=('27c05f4d45c5fd07b6fb0f044add3056'
	 '473e241974bd6d9c322de672b7eb4d17')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  patch -p1 -i ${srcdir}/gdkspanfunc.patch
  ./configure --prefix=/usr --disable-gtkglext-test --libdir=/usr/lib32 CXX='g++ -m32'
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir}/ install
  rm -rf ${pkgdir}/usr/{include,share}
}
