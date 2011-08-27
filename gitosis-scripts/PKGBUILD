# Maintainer: Laszlo Papp <djszapi @ gmail at com>
pkgname=gitosis-scripts
pkgver=1.0
pkgrel=1
pkgdesc="More comfortable interface for gitosis"
arch=('i686')
url="http://www.christoph-jahn.com/?p=650"
license=('GPL')
depends=('bash')
source=(http://www.christoph-jahn.com/wp-content/uploads/2009/06/$pkgname.tgz)
md5sums=('8cd269b06f9ee1bc4220e3e173137ab0')

build() {
    cd $srcdir/$pkgname
    install -d $pkgdir/usr/{bin,share/man/man1} || return 1
    install -Dm755 bin/* $pkgdir/usr/bin/ || return 1
    install -Dm644 man/man1/* $pkgdir/usr/share/man/man1/ || return 1
}
