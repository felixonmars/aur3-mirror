# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=solus-icon-theme
_pkgname=gnome-icon-theme-solus
pkgver=1.2.1
pkgrel=3
pkgdesc="Set of icons based on Elementary and Faenza icons, used in SolusOS"
arch=('any')
url="http://www.solusos.com"
license=('GPL3')
depend=('elementary-icon-theme')
source=("http://packages.solusos.com/pool/main/g/gnome-icon-theme-solus/gnome-icon-theme-solus_1.2.1.tar.gz")

package() {
	mkdir $pkgdir/usr
	cp -dpr --no-preserve=ownership $srcdir/$_pkgname-$pkgver/usr/* $pkgdir/usr/
}

md5sums=('ae29dbf618d4916b720d148bf6217a5a')
