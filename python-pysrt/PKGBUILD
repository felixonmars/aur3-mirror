# Maintainer: Otto Sabart <seberm[at]seberm[dot]com>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>
# Contributor: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgname=python-pysrt
pkgver=1.0.1
pkgrel=1
pkgdesc="Python parser for SubRip (srt) files"
arch=('any')
url="https://github.com/byroot/pysrt"
license=('GPL3')
depends=('python-chardet')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/p/pysrt/pysrt-${pkgver}.tar.gz)

package() {
  cd "${srcdir}/pysrt-${pkgver}"

  # Remove tests
  rm -rf tests
  
  python setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('2ba064c33026bac4b528063f67bd8ebc')
