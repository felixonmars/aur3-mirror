# Maintainer: Josip <josipponjavic@gmail.com>

pkgname=drakfire-evolution
pkgver=1.1
pkgrel=1
pkgdesc="Drakfire Evolution - GNOME Icon Theme (white-black tray)"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Drakfire+Evolution+%28white-black+tray%29?content=104614"
license=('GPL')
source=(https://dl.getdropbox.com/u/1106169/Drakfire%20Evolution.tar.gz
                  https://dl.getdropbox.com/u/1106169/Drakfire%20Evolution%20Inverted.tar.gz)
md5sums=('a89e44bce34f832ae21a5580b29de0da'
                        'a58272dd2170a0edd5530f19f7a004c3')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
        cp -R "$srcdir/Drakfire Evolution" "$pkgdir/usr/share/icons"
        cp -R "$srcdir/Drakfire Evolution Inverted" "$pkgdir/usr/share/icons"
}

