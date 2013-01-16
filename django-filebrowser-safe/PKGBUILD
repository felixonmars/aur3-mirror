# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=django-filebrowser-safe
pkgver=0.2.14
pkgrel=1
pkgdesc="A snapshot of the filebrowser_3 branch of django-filebrowser, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/filebrowser_safe/"
depends=('python2' 'django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/f/filebrowser_safe/filebrowser_safe-${pkgver}.tar.gz")
md5sums=('462f42d97792d346401a20f0338e8446')
sha256sums=('5f14b4fcfa1312c7587edd47e32f9fe7901c21063a17fed715b14c6ff2fa2687')

build() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}
