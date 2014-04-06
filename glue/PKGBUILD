# Maintainer: Alexander Wenzel <elkangaroo@gmail.com>
pkgname=glue
pkgver=0.9.4
pkgrel=1
pkgdesc='A simple command line tool to generate CSS sprites'
arch=('any')
url='https://github.com/jorgebastida/glue/'
license=('BSD')
depends=('python2' 'python2-pillow' 'python2-jinja')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('5745f0d57b0b48a01bbf28dcbe60248c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	python2 setup.py install --root="$pkgdir/" --optimize=1
}
