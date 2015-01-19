# Maintainer: Artemis
pkgname=parsepan
pkgver=0.9
pkgrel=1
pkgdesc="parsepan is a Python script to parse the results of SPIN's pan verifier, and to selectively retrieve information from verification reports."
arch=('any')
url="https://github.com/tcruys/$pkgname"
source=("$pkgname::git+https://github.com/tcruys/$pkgname")
md5sums=('SKIP')
license=('APACHE')
depends=('python2')
makedepends=('git' 'coreutils' 'awk' 'gzip')

pkgver() {
    cd "$srcdir/$pkgname"
    head --lines=1 README.txt | awk '{print $2}'
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i 's/\(#!\/usr\/bin\/python\)/\12/' parsepan
}

package() {
    gzip --force "$srcdir/$pkgname/parsepan.1"
    install -Dm755 "$srcdir/$pkgname/parsepan"      "$pkgdir/usr/bin/parsepan"
    install -Dm644 "$srcdir/$pkgname/parsepan.1.gz" "$pkgdir/usr/share/man/man1/parsepan.1.gz"
}
