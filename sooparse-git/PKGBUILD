# Maintainer: Tillmann Karras <tilkax@gmail.com>
pkgname="sooparse-git"
pkgver=0_11
pkgrel=1
pkgdesc='SOO – Simple Object Orientation (for C)'
url='https://bitbucket.org/trap15/sooparse'
arch=('i686' 'x86_64')
license=('unknown')
provides=('sooparse')
conflicts=('sooparse')
makedepends=('git')
source=('git+https://bitbucket.org/trap15/sooparse.git')
md5sums=('SKIP')
build() {
    cd sooparse
    make
}
package() {
    cd sooparse
    install -Dm755 sooparse "$pkgdir/usr/bin/sooparse"
    install -Dm644 README   "$pkgdir/usr/share/$pkgname/README"
}
pkgver() {
    cd sooparse
    echo 0_$(git rev-list --count master)
}
