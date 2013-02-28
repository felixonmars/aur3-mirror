# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=django-grappelli-safe
pkgver=0.2.12
pkgrel=1
pkgdesc="A snapshot of the grappelli_2 branch of django-grappelli, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/grappelli_safe/"
depends=('python2' 'django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/g/grappelli_safe/grappelli_safe-${pkgver}.tar.gz")
md5sums=('77470cbc5291de7fd99bcfee841d69dc')
sha256sums=('dec809249a0655abe9a8ae42b92bdac0c2d647bd8e720584ad6157c1a730218b')

build() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}
