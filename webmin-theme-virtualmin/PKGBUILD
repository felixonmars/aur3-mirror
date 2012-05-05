# Maintainer: Shanto
pkgname=webmin-theme-virtualmin
pkgver=8.4
pkgrel=1
pkgdesc="Virtualmin Framed Theme"
arch=('any')
url="http://www.webmin.com/"
license=('GPL')
#depends=('webmin')

package() {
	cd $srcdir
	wget "http://download.webmin.com/download/virtualmin/virtual-server-theme-$pkgver.wbt.gz"
	tar xvzf virtual-server-theme-$pkgver.wbt.gz
	install -d $pkgdir/opt/webmin/
	cp -R virtual-server-theme $pkgdir/opt/webmin/
}
