# Contributor: Jeff Bailes <thepizzaking@gmail.com>

pkgname=nuovext2-icon-theme
pkgver=2.2
pkgrel=2
pkgdesc="A revamp of the original nuoveXT icon set."
arch=('any')
url="http://nuovext.pwsp.net/"
license=('LGPL')
source=("http://nuovext.pwsp.net/files/nuoveXT.$pkgver.tar.bz2")
md5sums=("0e9abfed933976db0a313c0613483c72")

package() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
	mv "nuoveXT.$pkgver" "nuovext2"
	cp -r "nuovext2" $startdir/pkg/usr/share/icons/
}
