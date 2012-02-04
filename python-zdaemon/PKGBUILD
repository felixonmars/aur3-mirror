# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=zdaemon
pkgname=python-$_relname
pkgver=2.0.4
pkgrel=2
pkgdesc='Daemon process control library and tools for Unix-based systems'
arch=('any')
url='http://pypi.python.org/pypi/zdaemon'
license=('ZPL')
depends=('python2')
source=(http://pypi.python.org/packages/source/z/$_relname/$_relname-$pkgver.tar.gz)
md5sums=('7d358297df480abe93b6565fc0213c34')

build() {
  true
}

package() {
  cd $srcdir/$_relname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}

# vim:ts=2:sw=2:et:
