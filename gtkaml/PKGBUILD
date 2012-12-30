# Archlinux build script
# Maintainer: Vlad Grecescu <b100dian at gmail dot com>
pkgname=gtkaml
pkgver=0.6beta2
pkgrel=1
pkgdesc="Gtk+Vala application markup language"
arch=('i686' 'x86_64')
url="http://gtkaml.googlecode.com"
license=('LGPL')
depends=('vala>=0.18' 'gtk2' 'libxml2')
makedepends=('pkgconfig')
source=(http://gtkaml.googlecode.com/files/gtkaml-0.5.93.tar.bz2)
sha1sums=('4654b7023b769a039aef65d88d2f941b776e30f3')

build() {
	cd $startdir/src/gtkaml-0.5.93
	./configure --prefix=/usr --disable-silent-rules
	make || return 1
	make DESTDIR=$startdir/pkg install
	}
