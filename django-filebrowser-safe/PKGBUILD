# Submitter: fsckd <fsckdaemon@gmail.com>
# Maintainer: numeral <numerical@gmail.com>

pkgname=django-filebrowser-safe
pkgver=0.3.1
pkgrel=1
pkgdesc="A snapshot of the filebrowser_3 branch of django-filebrowser, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/filebrowser_safe/"
depends=('python2' 'python2-django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/f/filebrowser_safe/filebrowser_safe-${pkgver}.tar.gz")
md5sums=('0012708fc1610c8f5d24723ed6edea10')
sha256sums=('5cb4ff4390a3d369f8394d425df4899a6e568c943dbab551297b3412d696b240')

build() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}

