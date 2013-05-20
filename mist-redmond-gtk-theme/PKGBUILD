# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>

pkgname=mist-redmond-gtk-theme
_pkgname=Mist-Redmond
pkgver=1.2
pkgrel=1
pkgdesc="Mist like theme for gtk2/3 with colors from Redmond theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Mist-Redmond?content=155580"
license=('GPL')
depends=('gtk-engine-mist')
changelog=
source=("$pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/155580-gtk3.8-theme_Mist-Redmond.zip")

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/themes/$_pkgname
	cp -dpr --no-preserve=ownership $srcdir/$_pkgname/* $pkgdir/usr/share/themes/$_pkgname
}

md5sums=('a4ea5d98fca7756ead546da7a065b0ab')
