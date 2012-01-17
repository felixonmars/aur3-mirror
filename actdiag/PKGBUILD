# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=actdiag
pkgver=0.3.0
pkgrel=2
pkgdesc="Generate activity-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/actdiag"
license=(APACHE)
depends=('python2' 'blockdiag')
optdepends=('python-reportlab: to use the PDF output format')
makedepends=(python2-distribute)
changelog=Changelog
conflicts=('actdiag-hg')
source=("http://pypi.python.org/packages/source/a/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8817f19831eaedcedf40b24eb5e16227')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
