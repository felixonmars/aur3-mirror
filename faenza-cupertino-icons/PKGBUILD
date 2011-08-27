# Maintainer: Florian Besser <fbesser AT gmail.com>

pkgname=faenza-cupertino-icons
pkgver=0.7
pkgrel=4
pkgdesc="Recolored Folder Icons for Faenza Icontheme"
url="http://gnome-look.org/content/show.php/Faenza-Cupertino?content=129008"
license=('GPL3')
arch=('any')
depends=('faenza-icon-theme')
source=("http://gnome-look.org/CONTENT/content-files/129008-Faenza-Cupertino.tar.gz")

build(){
	cd $srcdir
	install -d -m755 $pkgdir/usr/share/icons/
	cp -r Faenza-Cupertino/ $pkgdir/usr/share/icons/
}

md5sums=('a01c8dbacf60a744c8b0eeeee1a7ad54')
