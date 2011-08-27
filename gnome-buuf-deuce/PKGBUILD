# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=gnome-buuf-deuce
pkgver=1.1_R8
pkgrel=2
pkgdesc="Icon theme for gnome."
arch=('any')
url="http://djany.deviantart.com/art/Gnome-Buuf-Deuce-1-1-R8-73339997"
license=('CCPL')
makedepends=('p7zip')
source=(http://fc00.deviantart.net/fs71/f/2009/342/a/0/Gnome_Buuf_Deuce_1_1_R8_by_djany.7z)
md5sums=('7aec403c96e2bbcebdb9442ff3b75029')

build() {
	cd ${srcdir}
	7z e -y Gnome_Buuf_Deuce_1_1_R8_by_djany.7z
	tar -jxvf Buuf-Deuce-${pkgver//_/-}.tar.bz2
	install -d ${pkgdir}/usr/share/icons/gnome-buuf-deuce
	cp -rf Buuf-Deuce/* ${pkgdir}/usr/share/icons/gnome-buuf-deuce
}
