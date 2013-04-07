# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: malysss@deviantart.com
pkgname=gtk-theme-malys-future
pkgver=2.0
pkgrel=1
pkgdesc="Malys Future Theme for gtk3, gtk2, Unity, MATE"
arch=('any')
url=('http://malysss.deviantart.com/art/malys-future-2-0-for-gnome-3-6-305854813')
license="GPL"
depends=('gtk-engines' 'gnome-themes-standard>=3.6.0' 'gtk-engine-unico' 'gdk-pixbuf2' 'bahamas-font')
source=('https://www.dropbox.com/s/hpo0rpi5fj0zl2m/gtk-theme-malys-future.tar.bz2')
md5sums=('61ca5ad81e28339304225106f1c14104')


package() {
	cd $srcdir
	tar xvf gtk-theme-malys-future.tar.bz2
	cp -R usr $pkgdir
}
