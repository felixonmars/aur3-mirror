# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=carrot-doc
_pkgname=carrot
pkgver=0.10.1
pkgrel=1
pkgdesc="Documentation for carrot, an AMQP messaging queue framework for Python."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/carrot/0.10.1"
license=('BSD')
makedepends=('python-sphinx')
source=(http://pypi.python.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('7d40d64b9bb89ac6723589638ce45a23')

build() {
  cd "$srcdir/$_pkgname-$pkgver/docs"

  mkdir -p "$pkgdir/usr/share/doc/carrot"
  sphinx-build -b html . "$pkgdir/usr/share/doc/carrot"
}

# vim:set ts=2 sw=2 et:
