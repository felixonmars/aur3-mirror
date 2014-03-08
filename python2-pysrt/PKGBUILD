# Maintainer: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgname=python2-pysrt
_pkgname=pysrt
pkgver=1.0.1
pkgrel=1
pkgdesc="Python parser for SubRip (srt) files"
arch=('any')
url="https://github.com/byroot/pysrt"
license=('GPL3')
depends=('python2-chardet')
makedepends=('python2-distribute')

source=(http://pypi.python.org/packages/source/p/pysrt/${_pkgname}-${pkgver}.tar.gz)
md5sums=('2ba064c33026bac4b528063f67bd8ebc')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Remove tests
  rm -rf tests
  
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
