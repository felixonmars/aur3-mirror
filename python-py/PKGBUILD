# Contributor: Hervé Cauwelier <herve ¤ oursours.net>
# Maintainer: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python-py
pkgver=1.4.17
pkgrel=1
pkgdesc="rapid testing and development utils"
arch=('any')
license=('MIT')
url="http://pylib.org/"
depends=('python')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/p/py/py-$pkgver.tar.gz)
md5sums=('1dba4de9f1ac9b3e025895a0b6ad5a91')

build() {
  cd "${srcdir}/py-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
