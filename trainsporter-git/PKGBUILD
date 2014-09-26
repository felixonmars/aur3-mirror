# Maintainer: Daniel Escoz <darkhogg[at]gmail[dot]com>
pkgname=trainsporter-git
pkgver=r556.8881a38
pkgrel=1
pkgdesc="A game about writing train AIs."
url="http://trainsportedgame.no-ip.org/"
arch=('any')
license=('custom:WTFPL')
depends=('love')
source=('run.sh'
    $pkgname::git+https://github.com/Germanunkol/trAInsported.git#branch=master)
md5sums=('65f1b46ffee8c96914b1f121eb2703a5'
         'SKIP')
_lovefile="trAInsporter.love"

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir"

    msg2 "Patch launcher"
    sed -i "$srcdir/run.sh" \
        -e "s#@@BASEDIR@@#/opt/trAInsporter#" \
        -e "s#@@LOVEFILE@@#$_lovefile#"
}

package () {
    cd "$srcdir"

    install -Ddm755 "$pkgdir/opt/trAInsporter"
    cp -r "$srcdir/$pkgname"/* "$pkgdir/opt/trAInsporter"

    install -Dm755 "run.sh" "$pkgdir/usr/bin/trAInsporter"
    install -Dm644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
