# Contributor: Kristaps Esterlins <kristaps dot esterlins at gmail dot com>
# Maintainer: Kristaps Esterlins <kristaps dot esterlins at gmail dot com>

pkgname=xcursor-industrial
pkgver=0.6.1.3
pkgrel=4
pkgdesc="Ximian developed mouse cursor theme"
arch=('i686' 'x86_64')
url="http://packages.debian.org/oldstable/gnome/industrial-cursor-theme"
license=('GPL')
source=(http://archive.debian.org/debian/pool/main/i/industrial-cursor-theme/industrial-cursor-theme_$pkgver.tar.gz)
md5sums=('c53c19b134dcb9c0b0c22f70832668d7')
build() {
	install -d 755 $startdir/pkg/usr/share/icons/Industrial

	cp -r $startdir/src/industrial-cursor-theme-$pkgver/* $startdir/pkg/usr/share/icons/Industrial
	
	rm -r $startdir/pkg/usr/share/icons/Industrial/debian
}
