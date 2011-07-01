# Contributor: celticmusicguy (Tony Upton) <celticmusicguy at gmail dot com>

pkgname=gtk-theme-simplicity
_pkgname=Simplicity
pkgver=0.1
pkgrel=2
pkgdesc="A modern, professional theme for Linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/simplicity-desktop-theme/"
license=('LGPL')
depends=('gnome-themes-standard')
source=(http://simplicity-desktop-theme.googlecode.com/files/Simplicity.tar.gz)
md5sums=('a9fe696c5869742fdc804876b71b89e0')

build() {
	# Variables for folders
	g2=gtk-2.0
	mt=metacity-1
	# Create pkgdir directories
	install -d ${pkgdir}/usr/share/themes/${_pkgname}/${g2}/
	install -d ${pkgdir}/usr/share/themes/${_pkgname}/${mt}/
	# Install
	cd ${srcdir}/${_pkgname}
	install -m644 ${g2}/* ${pkgdir}/usr/share/themes/${_pkgname}/${g2}/
	install -m644 ${mt}/* ${pkgdir}/usr/share/themes/${_pkgname}/${mt}/
}

