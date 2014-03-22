# Originator: mitsuse <mitsuset at gmail>
# Maintainer: tychoish <sam at tychoish com>
pkgname=python2-hieroglyph
pkgver=0.6.5
pkgrel=1
pkgdesc="hieroglyph is an extension for Sphinx which builds HTML5 slides from ReStructured Text documents."
arch=("any")
url="http://yergler.net/projects/hieroglyph/"
license=("BSD")
groups=()
depends=("python2" "python2-sphinx")
makedepends=("python2-distribute")
optdepends=()
provides=("python2-hieroglyph")
conflicts=("python2-hieroglyph-git")
replaces=("python2-hieroglyph-git")
backup=()
options=()
install=
source=("http://pypi.python.org/packages/source/h/hieroglyph/hieroglyph-${pkgver}.tar.gz")
md5sums=("2c7e145bdf01789a58aa4532894169ca")

build() {
    cd ${srcdir}/hieroglyph-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
