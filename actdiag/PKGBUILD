# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=actdiag
pkgver=0.5.3
pkgrel=1
pkgdesc="Generate activity-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/actdiag"
license=(APACHE)
depends=('python' 'blockdiag>=1.3.0')
optdepends=('python-reportlab: to use the PDF output format')
makedepends=(python-distribute)
changelog=Changelog
conflicts=('actdiag-hg')
source=("http://pypi.python.org/packages/source/a/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ff7c4063d27db6c0040bc04d9a4de67e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
