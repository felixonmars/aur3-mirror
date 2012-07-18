# Maintainer: mitsuse <mitsuset at gmail>
pkgname=python2-sphinxjp-themes-impressjs
pkgver=0.1.2
pkgrel=1
pkgdesc="A sphinx theme for HTML presentation style."
arch=(any)
url="http://pypi.python.org/pypi/sphinxjp.themes.impressjs/"
license=("MIT")
groups=()
depends=(
    "python2"
    "python2-sphinx"
    "python2-sphinxjp-themecore")
makedepends=("python2-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
    "http://pypi.python.org/packages/source/s/sphinxjp.themes.impressjs/sphinxjp.themes.impressjs-${pkgver}.tar.gz")
noextract=()
md5sums=("0c294c159800eda3611cc1b5999f3184")

package() { 
    cd $srcdir/sphinxjp.themes.impressjs-${pkgver}
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
