# Contributor: meatballhat <daniel.buch@gmail.com>
__capsname=Distutils2
__shortname=distutils2
__pypi="http://pypi.python.org"

pkgname=python2-$__shortname
pkgver="1.0a3"
pkgrel=1
pkgdesc="python distribution utilities"
arch=(any)
url="http://packages.python.org/$__capsname/"
license=("PSF")
groups=()
depends=(python2)
makedepends=()
optdepends=()
provides=($pkgname)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$__pypi/packages/source/D/$__capsname/$__capsname-$pkgver.tar.gz")
noextract=()
md5sums=('bb305e4d99305f2d801a70229a96ffbd')

build() {
    cd $srcdir/$__capsname-$pkgver
    python2 setup.py install \
        --optimize=1 \
        --root=${pkgdir} --prefix=/usr || return 1
}

# vim:filetype=sh
