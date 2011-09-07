# Contributor: Ralf Schmitt <ralf@systemexit.de>
# Last changed: 2011-09-06 20:47:48 by ralf

pkgname=python2-gevent
ver=0.13.6
pkgver=0.13.6
pkgrel=1
pkgdesc="Python network library that uses greenlet and libevent for easy and scalable concurrency"
license=("MIT")
url="http://www.gevent.org/"
depends=('python2' 'libevent' 'python2-greenlet')

source=(http://pypi.python.org/packages/source/g/gevent/gevent-$pkgver.tar.gz)

arch=('i686' 'x86_64')

md5sums=('7c836ce2315d44ba0af6134efbcd38c9')

build() {
  cd $startdir/src/gevent-$ver
  # patch -p1 < $startdir/patch || exit 1
  /usr/bin/python2 setup.py build || return 1
  /usr/bin/python2 setup.py install --root=$startdir/pkg
}
