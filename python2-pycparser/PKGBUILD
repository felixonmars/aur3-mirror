# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Yaron de Leeuw <jdlmail at gmail >

pkgname=python2-pycparser
pkgver=2.10
pkgrel=1
pkgdesc="Complete C99 parser in pure Python"
arch=('i686' 'x86_64')
depends=('python2' 'python2-ply')
makedepends=('python2-setuptools')
url="https://github.com/eliben/pycparser"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('d87aed98c8a9f386aa56d365fe4d515f')
sha256sums=('957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
