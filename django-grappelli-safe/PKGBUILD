# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=django-grappelli-safe
pkgver=0.2.11
pkgrel=1
pkgdesc="A snapshot of the grappelli_2 branch of django-grappelli, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/grappelli_safe/"
depends=('python2' 'django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/g/grappelli_safe/grappelli_safe-${pkgver}.tar.gz")
md5sums=('c27c3c5ce30ae50c5bc06f9a0cea620d')
sha256sums=('09492534440d9f1a9c7b7189787854200f011738df257854d9fb1d6d41c6a78b')

build() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/grappelli_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}
