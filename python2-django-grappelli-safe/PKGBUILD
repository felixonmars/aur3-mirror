# Submitter: fsckd <fsckdaemon@gmail.com>
# Contributor: numeral <numerical@gmail.com>
# Maintainer: Kniyl <mathias.ettinger@gmail.com>

pkgname=python2-django-grappelli-safe
pkgver=0.3.13
pkgrel=1
pkgdesc="A snapshot of the grappelli_2 branch of django-grappelli, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/grappelli_safe/"
depends=('python2' 'python2-django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/g/grappelli_safe/grappelli_safe-${pkgver}.tar.gz")
md5sums=('5c8c681a0b1df94ecd6dc0b3a8b80892')
sha256sums=('8b21b4724bce449cc4f22dc74ed0be9b3e841d968f3271850bf4836864304eb6')

build() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}
