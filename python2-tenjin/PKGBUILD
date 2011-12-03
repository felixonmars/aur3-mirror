# -*- shell-script -*-

python=python2
name=tenjin

pkgname=$python-$name
pkgver=1.0.2
pkgrel=3
pkgdesc="The Fastest template engine in the world. Python implementation."
arch=(any)
license=(MIT)
url='http://www.kuwata-lab.com/tenjin/'
depends=($python)
makedepends=($python-distribute)
source=(http://pypi.python.org/packages/source/T/Tenjin/Tenjin-${pkgver}.tar.gz)

build() {
  cd $srcdir/Tenjin-$pkgver
  $python setup.py install --prefix=/usr --root $pkgdir || return 1
  install -D -m644 MIT-LICENSE $pkgdir/usr/share/licenses/$python-$name/COPYING
  install -D -m644 README.txt $pkgdir/usr/share/$python-$name/README.txt
  /bin/cp -r doc $pkgdir/usr/share/$python-$name/doc
  /bin/cp -r examples $pkgdir/usr/share/$python-$name/examples
  /bin/cp -r benchmark $pkgdir/usr/share/$python-$name/benchmark
}
md5sums=('79273c8d6642d517596dee33d1434822')
