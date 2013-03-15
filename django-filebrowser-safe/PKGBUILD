# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=django-filebrowser-safe
pkgver=0.2.17
pkgrel=2
pkgdesc="A snapshot of the filebrowser_3 branch of django-filebrowser, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/filebrowser_safe/"
depends=('python2' 'python2-django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/f/filebrowser_safe/filebrowser_safe-${pkgver}.tar.gz")
md5sums=('8b9565ae13beedab06eac4d2e9e638a8')
sha256sums=('267c20189c5fff5bafaf20ce014e62264bdf745989a01045b2131e36dd71fac5')

build() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}

