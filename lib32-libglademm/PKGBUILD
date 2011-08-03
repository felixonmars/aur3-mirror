# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
_pkgbasename=libglademm
pkgname=lib32-$_pkgbasename
pkgver=2.6.7
pkgrel=2
pkgdesc="A C++ wrapper for libglade (32 bit)"
arch=('x86_64')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
depends=('lib32-libglade' 'lib32-gtkmm' "$_pkgbasename")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('f9ca5b67f6c551ea98790ab5f21c19d0')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib32 CC='gcc -m32' CXX='g++ -m32'
  make
}

check() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{include,share}
}
