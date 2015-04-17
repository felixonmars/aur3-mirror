# Maintainer: Joel Almeida <aulidolunar at gmai1 d0t c0m>

_packagename="libnotifymm"
_packagevermajor="0.7"
_packagevermicro="0"

pkgname=${_packagename}-gtk2
pkgver=${_packagevermajor}.${_packagevermicro}
pkgrel=0
pkgdesc="C++ wrappers for libnotify (gtkmm-2.4 version)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glibmm>=2.28.0' 'gtkmm>=2.20' 'libnotify>0.6')
makedepends=('mm-common' 'perl')
conflicts=('libnotifymm')
provides=('libnotifymm')
url="http://www.gnome.org/"
source=(
	gtkmm2.patch
	http://ftp.gnome.org/pub/gnome/sources/${_packagename}/${_packagevermajor}/${_packagename}-${_packagevermajor}.${_packagevermicro}.tar.xz
)

sha256sums=(
	'84c7cb51e3b3074cd71425fbefc7db310197d8f8362f0c2b8723e4b6d836c99c'
	'bfe4b4411265d5bf437408735a37b6ad8e4da772eec1e2aa18792745e6a60954'
)

prepare() {
	# patch to use gtkmm-2.4 version
	cd "$srcdir/${_packagename}-${_packagevermajor}.${_packagevermicro}"
	msg "Applying gtkmm-2.4 patch..."
	patch < ../gtkmm2.patch
	msg "Run autoreconf to regenerate configure..."
	autoreconf -fvi
	msg "Ok. Now let's build..."
}

build() {
	cd "$srcdir/${_packagename}-${_packagevermajor}.${_packagevermicro}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_packagename}-${_packagevermajor}.${_packagevermicro}"
	make DESTDIR="$pkgdir" install
}
