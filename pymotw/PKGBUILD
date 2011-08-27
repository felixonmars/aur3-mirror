# Contributor: tocer <tocer.deng@gmail.com>

pkgname=pymotw
_pkgname=PyMOTW
pkgver=1.132
pkgrel=2
pkgdesc="A tour of the Python standard library through short examples"
arch=(any)
url="http://www.doughellmann.com/PyMOTW/"
license=(custom)
source=(http://www.doughellmann.com/downloads/$_pkgname-$pkgver.tar.gz)
depends=('python2')
md5sums=('c9a5716a98d0d1b101ac654e2b2d3f41')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ || return 1

  sed -i '1s/python$/python2/' motw
  install -D -m755 motw $pkgdir/usr/bin/motw
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


