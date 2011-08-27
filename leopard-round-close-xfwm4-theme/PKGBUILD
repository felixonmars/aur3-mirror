# Contributor: Sebastian Benvenuti (santodelaespada) <sebastianbenvenuti@gmail.com>

pkgname=leopard-round-close-xfwm4-theme
pkgver=0.0.2
pkgrel=1
pkgdesc="Mac OSX leopard theme for xfwm4"
url='http://www.xfce-look.org/content/show.php/Leopard-round?content=75342'
license=('gpl')
arch=(any)
source=(Leopard-round-close.tar.gz)
md5sums=('69f23d5deca0ff359360d6bad5d6d88b')

build() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -R Leopard-round-close "${pkgdir}/usr/share/themes/"
}