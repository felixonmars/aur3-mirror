# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=PyProtocols
pkgname=python-protocols
pkgver=0.9.3
pkgrel=2
pkgdesc='API that lets you easily define your own protocols and adapters'
arch=('i686' 'x86_64')
url='http://peak.telecommunity.com/PyProtocols.html'
license=('PSF' 'ZPL')
depends=('python2')
makedepends=('setuptools')
source=(http://peak.telecommunity.com/dist/$_relname-$pkgver.tar.gz)
md5sums=('43df88c8772549640cfc40a78758bf7b')

build() {
  cd $srcdir/$_relname-$pkgver
  python2 setup.py build || return 1
}

package() {
  cd $srcdir/$_relname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}

# vim:ts=2:sw=2:et:
