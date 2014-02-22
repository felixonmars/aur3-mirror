# Maintainer: Ramalus <ronnieandrew92@gmail.com>
pkgname=usbformatter
pkgver=1.1
pkgrel=1
pkgdesc="Pendrive formatting GUI utility."
arch=('any')
url="http://www.roandigital.com"
license=('GPL')
depends=('dosfstools' 'python' 'gksu' 'python-pyqt4')
source=(https://www.dropbox.com/s/l1vtgqu1nyejbq4/$pkgname-$pkgver.tar.gz)
md5sums=('be5420aa93b16c11cd3bc6f1ffac560d')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
