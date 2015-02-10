# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=libvtemm2
pkgver=0.25
pkgrel=0
pkgdesc="VTEMM is the C++ Wrapper of VTE terminal widget. It is comfortable to use with gtkmm (GTK+ C++ Wrapper). (gtkmm-2.4 version)"
arch=('i686' 'x86_64')
url="http://vtemm.sourceforge.jp/"
license=('GPLv2')
depends=('glibmm>=2.22.0' 'pangomm>=2.24.0' 'gtkmm>=2.20.0' 'vte>=0.26.0')
source=("http://ie.archive.ubuntu.com/gnome/sources/libvtemm/$pkgver/libvtemm-$pkgver.$pkgrel.tar.bz2")
md5sums=('7c285812e0ee76acdd9b7f9704750452')

build() {
	cd "$srcdir/libvtemm-${pkgver}.${pkgrel}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/libvtemm-${pkgver}.${pkgrel}"
	make DESTDIR="$pkgdir" install
}
