# Originator: mitsuse <mitsuset at gmail>
# Maintainer: tychoish <sam at tychoish com>
pkgname=python-hieroglyph
pkgver=0.6.5
pkgrel=1
pkgdesc="hieroglyph is an extension for Sphinx which builds HTML5 slides from ReStructured Text documents."
arch=("any")
url="http://yergler.net/projects/hieroglyph/"
license=("BSD")
groups=()
depends=("python" "python-sphinx")
makedepends=("python-distribute")
optdepends=()
provides=("python-hieroglyph")
conflicts=("python-hieroglyph-git")
replaces=("python-hieroglyph-git")
backup=()
options=()
install=
source=("http://pypi.python.org/packages/source/h/hieroglyph/hieroglyph-${pkgver}.tar.gz")
md5sums=("2c7e145bdf01789a58aa4532894169ca")

package() {
    cd ${srcdir}/hieroglyph-${pkgver}/
    python setup.py install --root="${pkgdir}" --optimize=1
}
