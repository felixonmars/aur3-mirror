# Maintainer: Oliver Mader <b52 at reaktor42 de>
pkgname=python-mpd-twisted
pkgver=0.3.2
pkgrel=1
pkgdesc="An MPD client library using Twisted"
arch=('any')
url="https://code.reaktor42.de/projects/python-mpd-twisted"
license=('GPL3')
depends=('setuptools')
source=(http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('adbef71d39eff6fcb0469e0d99c8b6fb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" -O1
}
