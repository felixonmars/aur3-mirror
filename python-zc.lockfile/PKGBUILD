# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=zc.lockfile
pkgname=python-$_relname
pkgver=1.0.0
pkgrel=3
pkgdesc='Basic inter-process locks'
arch=('any')
url='http://pypi.python.org/pypi/zc.lockfile'
license=('ZPL')
depends=('python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/z/$_relname/$_relname-$pkgver.tar.gz)
md5sums=('6cf83766ef9935c33e240b0904c7a45e')

build() {
  true
}

package() {
  cd $srcdir/$_relname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}

# vim:ts=2:sw=2:et:
