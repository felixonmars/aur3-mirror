# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=django-filebrowser-safe
pkgver=0.2.13
pkgrel=1
pkgdesc="A snapshot of the filebrowser_3 branch of django-filebrowser, packaged as a dependency for the Mezzanine CMS for Django"
arch=('any')
license=('Custom') # may mod of BSD
url="http://pypi.python.org/pypi/filebrowser_safe/"
depends=('python2' 'django')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/f/filebrowser_safe/filebrowser_safe-${pkgver}.tar.gz")
md5sums=('d0a91902c54fa5904770bfd17d06396f')
sha256sums=('47070017fd965da3c87826fb845e16c02b228587a623aa2107aee029da84dce9')

build() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/filebrowser_safe-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="${pkgdir}"
}
