# Contributor: Ronny Radke <ronnymichaelradke at web point de>
pkgname=pygi
pkgver=0.6.0
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="http://linux.softpedia.com/get/Programming/Libraries/PyGI-56097.shtml"
license=('LGPL')
groups=(lib)
depends=(gnome-common python gtk )
source=(http://download.gnome.org/sources/pygi/0.6/pygi-0.6.0.tar.gz)
md5sums=('f300e27e4ffc046843750286809fea68')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make -j1 DESTDIR="$pkgdir/" install || return 1
}
