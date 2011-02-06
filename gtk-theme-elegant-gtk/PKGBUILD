# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=gtk-theme-elegant-gtk
pkgver=4.0
pkgrel=1
pkgdesc="Elegant GTK theme, part of the Elegant Gnome Pack."
arch=('any')
url='http://gnome-look.org/content/show.php/Elegant+Gnome+Pack?content=127826'
license=('GPL')
depends=('gtk-engine-murrine')
optdepends=('awoken-icons: default icon set to use with this theme.'
            'xcursor-neutral++: default cursor set to use with this theme.'
            'ttf-droid: suggested font by the author.')
source=(http://ompldr.org/vNjRwNQ/Elegant-GTK-4.0.tar.gz
        Round.theme
        Square.theme)
sha1sums=('ba044bee7b407153ad8ad5835fd24f92a1a14809'
          'a06557881036ecce56af62b1ca852bee5a68db36'
          'eeb3c132ae45be0389da014c061a3c6df640169a')

build() {
	true
}

package() {
	cd ${srcdir}
	mkdir -p $pkgdir/usr/share/themes
	cp Round.theme Elegant-GTK-Rounded/index.theme
	cp Square.theme Elegant-GTK-Squared/index.theme
	cp -r {Elegant-GTK,Elegant-GTK-Rounded,Elegant-GTK-Squared} $pkgdir/usr/share/themes
}
