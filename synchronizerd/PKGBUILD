# Maintainer: Ramalus <ronnieandrew92@gmail.com>
pkgname=synchronizerd
pkgver=1.0
pkgrel=1
pkgdesc="Rsync GUI frontend. (Synchronize your folder/files)"
arch=('any')
url="http://www.roandigital.com/applications/synchronizerd"
license=('GPL')
depends=('python-pyqt4' 'python3')
source=(https://www.dropbox.com/s/14ce18htimdhp5e/synchronizerd-1.0.tar.gz)
md5sums=('eaa4b3733695bced67a64f26d29e7712')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
