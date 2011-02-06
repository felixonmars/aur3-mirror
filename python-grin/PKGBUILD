# Contributor: meatballhat <daniel.buch@gmail.com>
__shortname=grin
__pypi="http://pypi.python.org"

pkgname=python-$__shortname
pkgver="1.1.1"
pkgrel=2
pkgdesc="grep + find, or 'A grep program configured the way I like it.'"
arch=(any)
url="http://pypi.python.org/pypi/$__shortname/$pkgver"
license=("custom:Enthought")
groups=()
depends=(python python-argparse)
makedepends=(setuptools)
optdepends=()
provides=($pkgname)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$__pypi/packages/source/g/$__shortname/$__shortname-$pkgver.tar.gz")
noextract=()
md5sums=(9dca5a5876938adfd9dfc20869818660)

build() {
    cd $srcdir/$__shortname-$pkgver
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1

    install -D -m644 $srcdir/$__shortname-$pkgver/LICENSE.txt \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:filetype=sh
