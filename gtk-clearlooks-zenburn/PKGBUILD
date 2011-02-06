# Maintainer: Schnouki <thomas.jost@gmail.com>

pkgname=gtk-clearlooks-zenburn
_pkgname=Clearlooks-Zenburn
pkgver=0.1.4
pkgrel=1
pkgdesc="A mod of Clearlooks-Colors with a Zenburn palette"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/Clearlooks+Zenburn?content=103035"
license=('GPL')
depends=('gtk-engines')
source=(http://opendesktop.org/CONTENT/content-files/103035-Clearlooks-Zenburn.tar.gz)
md5sums=('8b5b83f8099e649b23c079249a7b3e5d')
sha1sums=('64f7305502d012d15f1aa5fb137d49418d722327')

build () {
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R $srcdir/${_pkgname} ${pkgdir}/usr/share/themes || return 1
}
