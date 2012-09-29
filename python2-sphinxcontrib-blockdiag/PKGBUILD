# Maintainer: pypi2pkg.py <youremail@domain.com>
pkgname=python2-sphinxcontrib-blockdiag
pkgver=1.1.2
pkgrel=1
pkgdesc='Sphinx "blockdiag" extension'
arch=(any)
url="http://pypi.python.org/pypi/sphinxcontrib-blockdiag"
license=("BSD")
groups=()
depends=(
    "python2"
    "blockdiag>=1.1.0"
    "python2-sphinx>=0.6")
makedepends=("python2-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "http://pypi.python.org/packages/source/s/sphinxcontrib-blockdiag/sphinxcontrib-blockdiag-$pkgver.tar.gz")
noextract=()
md5sums=(
    "ee57a4050dcf43e0315077881a438cbe")

build() { 
    cd $srcdir/sphinxcontrib-blockdiag-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
