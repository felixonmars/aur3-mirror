# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=actdiag
pkgver=0.3.3
pkgrel=1
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
md5sums=('9fe115a937539c43cf9d16a5d79e20d6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
