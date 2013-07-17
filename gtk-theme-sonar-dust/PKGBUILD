# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Josip <josipponjavic@gmail.com>

pkgname=gtk-theme-sonar-dust
pkgver=1.3
pkgrel=1
pkgdesc="A GTK2 theme based on Sonar with Dust colors and Humanity Icons."
arch=('any')
url="http://www.gnome-look.org/content/show.php/Sonar+Dust+?content=116503"
license=('Creative Commons by-nc-nd')
source=(http://www.gnome-look.org/CONTENT/content-files/116503-Sonar-Dust.tar.gz)
md5sums=('c4cb996459ce16d8632ac48c1c280abf')

package() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/themes/
	cp -r "Sonar-Dust" $startdir/pkg/usr/share/themes/
}

