# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: x-demon

pkgname=gtk-theme-clearlooks-clearlux
pkgver=0.7.1
pkgrel=1
pkgdesc="ClearLUX GTK theme for Clearlooks engine"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/ClearLUX?content=94004"
license=('GPL')
depends=('gtk-engine-murrine')
source=(http://www.gnome-look.org/CONTENT/content-files/94004-ClearLUX%201.3.tar.gz)
md5sums=('38780b964a9cb98435eb13d98c9a85b6')

package() {
	mkdir -p $pkgdir/usr/share/themes/clearlux
	cp -R $srcdir/$_pkgname/ClearLUX\ 1.3/* $pkgdir/usr/share/themes/clearlux
}
