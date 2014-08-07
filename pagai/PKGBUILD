# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: science
pkgname='pagai'
pkgver='20140710'
pkgrel=1
pkgdesc='A path sensitive static analyzer'
arch=('i686' 'x86_64')
url='http://pagai.forge.imag.fr/'
license=('custom')
optdepends=(
    'clang: generate input LLVM bytecode'
    'z3: default SMT solver'
)
if test "$CARCH" == 'i686'; then
    source=('https://forge.imag.fr/frs/download.php/565/pagai-040714-i686.tar.gz')
    md5sums=('5c82f047b84faac6ec98ce02005e032c')
else
    source=('https://forge.imag.fr/frs/download.php/585/pagai-071014-x86_64.tar.gz')
    md5sums=('315963b7d0e0dcad557a68f962e85b33')
fi

package() {
    cd "$srcdir"
    install -m 0755 -d "$pkgdir/usr/bin"
    install -m 0755 "pagai" "$pkgdir/usr/bin/pagai"
}
