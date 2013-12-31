# Mantainer: Alcasa <alcasa@live.de>

_themename=NumixBlue
pkgname=gtk-theme-numixblue
pkgver=1.3
pkgrel=1
pkgdesc="Blue version of the Numix theme by newfyworld2 (supports GTK 2, GTK 3, Xfwm and Openbox)"
arch=('any')
url=('https://github.com/newfyworld/NumixBlue')
license=('GPL3')
depends=('gtk-engine-murrine')
source=('https://github.com/newfyworld/NumixBlue/archive/master.zip')
md5sums=('ddd9e346bd8dfec14d19eaf82dfd694d')

package() {
	mkdir -p ${pkgdir}/usr/share/themes/${_themename}
	cd ${srcdir}/${_themename}-master
        cp -R ./* ${pkgdir}/usr/share/themes/${_themename}
}
