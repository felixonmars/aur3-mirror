# Maintainer: Nicolas Cornu <nicolac76@yahoo.fr>

pkgname=python2-lpod-python
pkgName=lpod-python
pkgver=1.1.5
pkgrel=1
pkgdesc="Languages & Platforms OpenDocument: Python implementation"
arch=('any')
license=('GPL3' 'APACHE2')
url="http://www.lpod-project.org/"
depends=('python2-lxml' 'python2-setuptools')
source=("${pkgName}.tar.gz::https://github.com/lpod/${pkgName}/archive/v${pkgver}.tar.gz")
sha1sums=('6905484c0aa543882fc8a514df882548d254ed0f')

build() {
  cd "${srcdir}/${pkgName}-${pkgver}"
  python2 setup.py build || return 1
}

package() {
  cd "${srcdir}/${pkgName}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" || return 1
}
