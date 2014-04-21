# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=python2-dicttoxml
_pypiname=dicttoxml
pkgver=1.3.1
pkgrel=1
pkgdesc="Simple library to convert a native Python dictionary into XML"
arch=('any')
url="https://github.com/quandyfactory/dicttoxml"
license=('GPL2')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install -O1 --root "${pkgdir}"
}

sha512sums=('8d69aa0d7aab23b06d1a14c9e1788ad3bc040a46d34bede4b2523756d6fc422248fa76a8d760a8eb75900c0464d89b878868ffbfdd42dd2eeed4eb86eaf79b2e')
