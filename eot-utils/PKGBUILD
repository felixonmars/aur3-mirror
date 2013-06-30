# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Ruoff <tomru@ido.cassiopeia.uberspace.de>
pkgname=eot-utils
pkgver=1.1
pkgrel=1
pkgdesc="Create EOT files from OpenType or TrueType"
arch=('any')
url="http://www.w3.org/Tools/eot-utils/"
license=('W3C')
source=("http://www.w3.org/Tools/eot-utils/eot-utilities-${pkgver}.tar.gz")
md5sums=('eb338106c979dc8c4576f8c0f466088b')

build() {
    cd "$srcdir/eot-utilities-$pkgver"
    ./configure --prefix=/usr
    make
}
check() {
    cd "$srcdir/eot-utilities-$pkgver"
    make -k check
}
package() {
    cd "$srcdir/eot-utilities-$pkgver"
    make DESTDIR="$pkgdir/" install
}
