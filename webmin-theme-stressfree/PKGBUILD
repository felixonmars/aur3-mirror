# Maintainer: Shanto
pkgname=webmin-theme-stressfree
pkgver=2.10
pkgrel=1
pkgdesc="Webmin Theme StressFree"
arch=('any')
url="http://code.google.com/p/webmin-theme-stressfree/"
license=('GPL')
depends=('webmin')
source=('http://webmin-theme-stressfree.googlecode.com/files/theme-stressfree-2.10.tar.gz')

package() {
	cd $srcdir
	install -d $pkgdir/opt/webmin/
	cp -R theme-stressfree $pkgdir/opt/webmin/
}

md5sums=('056cc598721f9344c51a3a227309f92a')
