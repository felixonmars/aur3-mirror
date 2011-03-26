# Maintainer: Josip <josipponjavic@gmail.com>

pkgname=pidgin-screenlet
pkgver=0.3.3
pkgrel=1
pkgdesc="Shows the contact-list on the desktop"
arch=('any')
url="http://www.gnome-look.org/content/show.php/PidginScreenlet?content=72611"
license=('GPL')
source=(http://www.gnome-look.org/CONTENT/content-files/72611-PidginScreenlet-0.3.3.tar.gz)
md5sums=('3f20cdd3a2789a9ba94aff5dbda8a010')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/screenlets/
	cp -r "Pidgin" $startdir/pkg/usr/share/screenlets/
}

