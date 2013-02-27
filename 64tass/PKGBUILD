# Contributor: lobotomius at gmail dot com

pkgname=64tass
pkgver=350
pkgrel=1
pkgdesc="6502/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02 Turbo Assembler"
arch=('any')
url='http://tass64.sourceforge.net'
license=('GPL')

_svntrunk='https://tass64.svn.sourceforge.net/svnroot/tass64'
_svnmod='tass64'

build() {

    if [ -d $_svnmod/.svn ]; then
	(cd $_svnmod && svn up -r $pkgver)
    else
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    cd "$srcdir/tass64/trunk"
    make
}

package() {
    cd "$srcdir/tass64/trunk"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 64tass "$pkgdir/usr/bin"
    :
}