# Maintainer: Artemis
pkgname=runspin
pkgver=0.9
pkgrel=3
pkgdesc='runspin is a bash script to automate the verification of Promela models using the model checker SPIN.'
arch=('any')
url="https://github.com/tcruys/$pkgname"
source=("$pkgname::git+https://github.com/tcruys/$pkgname")
md5sums=('SKIP')
license=('APACHE')
depends=('bash' 'spin' 'gcc')
makedepends=('git' 'coreutils' 'awk' 'gzip')

pkgver() {
    cd "$srcdir/$pkgname"
    head --lines=1 README.txt | awk '{print $2}'
}

package() {
    gzip --force "$srcdir/$pkgname/runspin.1"
    install -Dm755 "$srcdir/$pkgname/runspin"      "$pkgdir/usr/bin/runspin"
    install -Dm644 "$srcdir/$pkgname/runspin.1.gz" "$pkgdir/usr/share/man/man1/runspin.1.gz"
}
