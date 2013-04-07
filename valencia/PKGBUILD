# Maintainer: Wolfgang Morawetz <wolfgang.morawetz@gmail.com>
pkgname=valencia
pkgver=0.4.0
pkgrel=1
pkgdesc="Turn gedit into a Vala development environment"
url="http://redmine.yorba.org/projects/valencia/wiki"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gedit' 'libgee' 'gtksourceview3' 'vala' 'vte3')
conflicts=('valencia' 'valencia-gedit3-git')
install=${pkgname}.install
source=("http://yorba.org/download/valencia/stable/${pkgname}-${pkgver}.tar.xz")
md5sums=('f795b66ab0ffd537c8f61975310537eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -i "../../Makefile.diff" -p0
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
