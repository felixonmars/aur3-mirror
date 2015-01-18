# Maintainer: Maximilian John <maximilian.john at outlook dot com>

pkgname=catfish-gtk2
_pkgname=catfish
pkgver=0.3.2
pkgrel=1
pkgdesc="Versatile file searching tool (GTK2 version)"
arch=("i686" "x86_64")
url="https://launchpad.net/catfish-search"
license=('GPL')
depends=('glade2' 'gtk2'  'pygtk' 'python2-dbus' 'python2-gobject' 'python2-pexpect' 'python2-xdg' 'xdg-utils')
optdepends=(
	'zeitgeist: integration with zeitgeist'
	'findutils: filename search'
	'mlocate: filename search'
	'tracker: fulltext search'
	'strigi: fulltext search'
	'pinot: fulltext search'
)
conflicts=(catfish)
source=("http://www.twotoasts.de/media/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b28db355094bfbe7de097678e91ce271')

prepare() {
	cd "$_pkgname-$pkgver"
	sed -i 's,python,python2,g' configure
	sed -i 's,python,python2,g' catfish.in
	sed -i 's,python,python2,g' Makefile.in
}

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
