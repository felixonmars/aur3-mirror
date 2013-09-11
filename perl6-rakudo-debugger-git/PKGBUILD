# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-rakudo-debugger-git
pkgver=20130909.af2f675
pkgrel=1
pkgdesc="A debugger for Rakudo."
arch=('i686' 'x86_64')
url='https://github.com/jnthn/rakudo-debugger#readme'
license=('PerlArtistic')
depends=('rakudo' 'perl6-term-ansicolor')
provides=('perl6-rakudo-debugger')
makedepends=('git' 'perl6-panda')
source=('rakudo-debugger::git://github.com/jnthn/rakudo-debugger.git')
md5sums=('SKIP')

pkgver() {
    cd rakudo-debugger
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd rakudo-debugger
    panda-build
}
package() {
    cd rakudo-debugger
    install -Dm644 blib/lib/Debugger/UI/CommandLine.pm $pkgdir/usr/lib/parrot/5.6.0/languages/perl6/site/lib/Debugger/UI/CommandLine.pm
    install -Dm644 blib/lib/Debugger/UI/CommandLine.pir $pkgdir/usr/lib/parrot/5.6.0/languages/perl6/site/lib/Debugger/UI/CommandLine.pir
    install -Dm755 bin/perl6-debug $pkgdir/usr/bin/perl6-debug
    install -Dm644 README.markdown $pkgdir/usr/share/doc/rakudo-debugger/README.markdown
}
