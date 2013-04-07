# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: malysss@deviantart.com
pkgname=gtk-theme-malys-revolt
pkgver=2.0
pkgrel=1
pkgdesc="Malys RevoLT Theme for gtk3, gtk2, Unity"
arch=('any')
url=('http://malysss.deviantart.com/art/malys-RevoLT-3-7-update-04-08-2012-298513803')
license="GPL"
depends=('gtk-engines' 'gnome-themes-standard>=3.6.0' 'gtk-engine-unico' 'gdk-pixbuf2')
source=('https://www.dropbox.com/s/mhge0dzkcp1yo23/gtk-theme-malys-revolt.tar.bz2')
md5sums=('1a2bdb72fb3c8c4dda3138b2d0bed846')


package() {
	cd $srcdir
	tar xvf gtk-theme-malys-revolt.tar.bz2
	cp -R usr $pkgdir
}
