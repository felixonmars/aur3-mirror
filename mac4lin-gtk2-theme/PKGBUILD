# Contributor: Sebastian Benvenuti (santodelaespada) <sebastianbenvenuti@gmail.com>

pkgname=mac4lin-gtk2-theme
pkgver=1.0
pkgrel=1
pkgdesc="Mac OSX leopard gtk2 theme"
url='http://sourceforge.net/projects/mac4lin/'
license=('gpl')
arch=(any)
source=(mac4lin-gtk2.tar.gz)
md5sums=('8280eae3893936c080a377e27497ed69')

build() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/themes/OSX_leopard"
	cp -R gtk-2.0 "${pkgdir}/usr/share/themes/OSX_leopard/"
}