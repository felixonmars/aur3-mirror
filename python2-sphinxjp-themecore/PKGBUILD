# Maintainer: mitsuse <mitsuset at gmail>
pkgname=python2-sphinxjp-themecore
pkgver=0.1.3
pkgrel=1
pkgdesc="A sphinx theme plugin support extension. #sphinxjp"
arch=(any)
url="http://pypi.python.org/pypi/sphinxjp.themecore/"
license=("MIT")
groups=()
depends=(
    "python2" "python2-sphinx")
makedepends=("python2-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
    "http://pypi.python.org/packages/source/s/sphinxjp.themecore/sphinxjp.themecore-${pkgver}.tar.gz")
noextract=()
md5sums=("2aea7f9b80cde94e0feca5e79d1d41e6")

package() { 
    cd $srcdir/sphinxjp.themecore-${pkgver}
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
