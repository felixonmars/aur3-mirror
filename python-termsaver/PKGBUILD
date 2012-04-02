# Maintainer: pypi2pkg.py <youremail@domain.com>

pkgname=python-termsaver
pkgver=0.1
pkgrel=1
pkgdesc="Simple text-based terminal screensaver."
arch=(any)
url="http://pypi.python.org/pypi/termsaver"
license=("Apache License v2")
groups=()
depends=("python2")
makedepends=("python-distribute")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "http://pypi.python.org/packages/source/t/termsaver/termsaver-0.1.tar.gz")
noextract=()
md5sums=(
    "6e593d0c6d88c77f44f5b5b7449c043e")

build() { 
    cd $srcdir/termsaver-0.1
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}