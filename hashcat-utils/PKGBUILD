# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-hashcat-utils

pkgname=hashcat-utils
pkgver=1.1
pkgrel=1
pkgdesc="A set of small utilities that are useful in advanced password cracking"
arch=('i686' 'x86_64')
url='http://hashcat.net/wiki/doku.php?id=hashcat_utils'
license=('custom')
depends=('perl')
source=("http://hashcat.net/tools/hashcat-utils/$pkgname-$pkgver.7z"
        'Makefile')
sha256sums=('a586d3f0405092ac571ea1daddf9f36556e7a9ef199931294eba9369a3f623ba'
            '35601b25fb981db9390fbd54c3e2cb0c904725e8bfeba9680cf831dc879ad36c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cp ../Makefile .
    make clean
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
