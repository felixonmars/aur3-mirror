# Contributor: Vincent Delft  <vincent_delft ][ yahoo.com>

pkgname=pyevent
_pkgname=event
pkgver=0.4.2
pkgrel=2
pkgdesc="python interface to libevent"
url="http://code.google.com/p/pyevent/"
license="BSD"
arch=('i686')
depends=('pyrex' 'libevent')
source=(http://pyevent.googlecode.com/files/event-0.4.2.zip)
sha1sum=('8effe5c67dd72a617360183e0c88ea4383f10871')
md5sums=('c4b1267a8633e707eead5e3d0c78d8a6')

build() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py install --root=$pkgdir
}

