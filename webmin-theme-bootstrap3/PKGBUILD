# Maintainer: nemanjan00
pkgname=webmin-theme-bootstrap3
pkgver=0.5.2
pkgrel=1
pkgdesc="Webmin Theme Bootstrap3"
arch=('any')
url="http://theme.winfuture.it/"
license=('GPL')
depends=('webmin')
source=('http://theme.winfuture.it/bootstrap.wbt.gz')

package() {
	cd $srcdir
	install -d $pkgdir/opt/webmin/
	cp -R bootstrap $pkgdir/opt/webmin/bootstrap-theme
}

md5sums=('6015151a5f12befe1809eb3a270b7999')