pkgname=python2env
pkgver=1.0
pkgrel=1
pkgdesc="Executes commands with python2 as default python"
arch=('any')
url="https://github.com/FrozenCow/python2env"
license=('GPL')
depends=('python2')
source=('python2env')
md5sums=('403534e75b1b9620fc26d1619448cf56')

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/bin
	install -m 755 python2env $pkgdir/usr/bin/python2env
}
