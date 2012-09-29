# vim:set ts=2 sw=2 et:
# Maintainer: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=hsaudiotag3k
pkgver=1.1.3
pkgrel=1
pkgdesc="Read metadata (tags) of mp3, mp4, wma, ogg, flac and aiff files (python3 version)"
url="http://pypi.python.org/pypi/hsaudiotag3k"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}

md5sums=('77fc873857303e889851605e9836669b')
