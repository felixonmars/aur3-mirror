# Submitter: fsckd <fsckdaemon@gmail.com>
# Contributor: numeral <numerical@gmail.com>
# Maintainer: Kniyl <mathias.ettinger@gmail.com>

pkgname=python-django-filebrowser-safe
pkgver=0.3.8
pkgrel=1
pkgdesc="A snapshot of the filebrowser_3 branch of django-filebrowser, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/filebrowser_safe/"
depends=('python' 'python-django')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/f/filebrowser_safe/filebrowser_safe-${pkgver}.tar.gz")
md5sums=('d68e472bbde493e358479e0cf18c12d7')
sha256sums=('33039239e9c4bfb1c0a26fa548d2fdc81265f6a11e13c914201fb1e540b3a33f')

build() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}"
}

