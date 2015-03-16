# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Vincent Delft  <vincent_delft ][ yahoo.com>

pkgname=python2-event
_pkgname=event
pkgver=0.4.3
pkgrel=1
pkgdesc="python2 interface to libevent"
url="https://github.com/jaraco/pyevent"
license="BSD"
arch=('i686' 'x86_64')
depends=('libevent1')
makedepends=('pyrex')
source=(https://pypi.python.org/packages/source/e/$_pkgname/$_pkgname-$pkgver.zip)
sha1sum=('8effe5c67dd72a617360183e0c88ea4383f10871')
md5sums=('d79f02b6e409c631a088922038a68881')


build() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py install --root=$pkgdir --prefix=/usr
}
