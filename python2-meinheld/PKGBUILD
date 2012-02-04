# -*- shell-script -*-

python=python2
name=meinheld

pkgname=$python-$name
pkgver=0.4.13
pkgrel=2
pkgdesc="High performance asynchronous Python WSGI Web Server"
arch=(i686 x86_64)
url='http://meinheld.org/'
license=(BSD)
depends=($python-greenlet glibc)
makedepends=($python gcc)
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz)

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py install --prefix=/usr --root=$pkgdir
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$python-$name/COPYING
  install -D -m644 README.rst $pkgdir/usr/share/$python-$name/README.rst
  install -D -m644 NEWS $pkgdir/usr/share/$python-$name/NEWS
}
md5sums=('cb2e49cee31cc64b12f4bcadfb1b3601')
