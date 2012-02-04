# Maintainer: Josip <josipponjavic@gmail.com>

pkgname=kamel-alpha
pkgver=0.3
pkgrel=1
pkgdesc="Kamel icons"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Kamel+icons?content=59006"
license=('Creative Commons License')
source=(http://www.gnome-look.org/CONTENT/content-files/59006-Kamel-alpha-0.3.tar.gz)
md5sums=('0c71a7ce51deffee601a6d980686a25f')

build() {
	cd $startdir/src/
        chmod -R 755 $startdir/src/Kamel
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "Kamel" $startdir/pkg/usr/share/icons/
}

