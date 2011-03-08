# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=pymplayer
pkgver=0.6.0
pkgrel=1
pkgdesc="Lightweight and dynamic MPlayer wrapper with a Pythonic API"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/PyMPlayer/"
license=('LGPL3')
depends=('mplayer' 'python2')
source=(http://pypi.python.org/packages/source/P/PyMPlayer/PyMPlayer-$pkgver.tar.gz)
md5sums=('df7b9b8c4bf9d0655709c9cbf21365e2')

build() {
  cd "$srcdir/PyMPlayer-$pkgver"

  python setup.py install --root=$pkgdir --optimize 1
}

# vim:set ts=2 sw=2 et:
