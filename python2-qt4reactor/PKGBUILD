# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=qt4reactor
pkgname=python2-qt4reactor
pkgver=1.0
pkgrel=1
pkgdesc="Integration of Twisted and Qt4"
arch=('any')
url="https://launchpad.net/qt4reactor"
license=('custom:Expat')
depends=('python2-pyqt' 'twisted')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${_pkgname}_$pkgver.orig.tar.gz)
md5sums=('a8193bb7eb0165a814aa09a0192cf40b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
