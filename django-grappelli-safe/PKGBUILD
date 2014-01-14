# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=django-grappelli-safe
pkgver=0.3.4
pkgrel=1
pkgdesc="A snapshot of the grappelli_2 branch of django-grappelli, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/grappelli_safe/"
depends=('python2' 'python2-django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/g/grappelli_safe/grappelli_safe-${pkgver}.tar.gz")
md5sums=('b791e5e07f69eb42d6db87b5bf2888b7')
sha256sums=('a28e5ff3e6657bbc2b46480abdb364f509b5115dacfc4ec7a9061c08092c920a')

build() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}
