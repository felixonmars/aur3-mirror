# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Kristaps Esterlins <esterlinsh@gmail.com>

pkgname=gtk-theme-murrine-spacedust
pkgver=0.1
pkgrel=1
pkgdesc="Spacedust GTK theme for Murrine engine"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/spacedust?content=105448"
license=('GPL')
depends=('gtk-engine-murrine')
source=(http://www.gnome-look.org/CONTENT/content-files/105448-spacedust.tar.gz)
md5sums=('5caca728a89c3d10ef314121ce302c75')

package () {
	mkdir -p $pkgdir/usr/share/themes
	cp -R $srcdir/$_pkgname/spacedust/ $pkgdir/usr/share/themes
}
