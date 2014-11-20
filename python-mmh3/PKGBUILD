# Maintainer: Markus Gräb <markus.graeb@gmail.com
pkgname=python-mmh3
pkgver=2.2
pkgrel=1
pkgdesc="Python wrapper for MurmurHash (MurmurHash3), a set of fast and robust hash functions."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/mmh3/2.2"
license=('Public Domain')
depends=('python')
makedepends=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/m/mmh3/mmh3-2.2.tar.gz')
md5sums=('de69924d56b7838e818de246591cdb8b')

package() {
  cd "$srcdir/mmh3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
