# Contributor: Ralf Schmitt <ralf@systemexit.de>
# Last changed: 2011-02-14 08:48:05 by ralf

pkgname=python-gevent
ver=0.13.3
pkgver=0.13.3
pkgrel=2
pkgdesc="Python network library that uses greenlet and libevent for easy and scalable concurrency"
license=("MIT")
url="http://www.gevent.org/"
depends=('python2' 'libevent' 'python2-greenlet')

source=(http://pypi.python.org/packages/source/g/gevent/gevent-$pkgver.tar.gz)
#source=(http://www.gevent.org/dist/gevent-$ver.tar.gz)

arch=('i686' 'x86_64')

md5sums=('af1b6438ac62e10ab521f51366e3f0e4')

build() {
  cd $startdir/src/gevent-$ver
  # patch -p1 < $startdir/patch || exit 1
  /usr/bin/python2 setup.py build || return 1
  /usr/bin/python2 setup.py install --root=$startdir/pkg
}
