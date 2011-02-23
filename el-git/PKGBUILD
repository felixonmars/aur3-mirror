# Maintainer: rupa <rupa@lrrr.us>
# Development: https://github.com/rupa/el

pkgname=el-git
pkgver=20110223
pkgrel=1
pkgdesc="mnemonic wrapper for EDITOR"
url="https://github.com/rupa/el/ "
arch=('any')
license=('WTFPL')
depends=('readline' 'ncurses' 'sh')
makedepends=('git' 'help2man')

_gitroot="git://github.com/rupa/el.git"
_gitname="el"

build() {
    cd $srcdir
    msg "Connection to z repository..."
    if [ -d $srcdir/$_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot && cd $_gitname
    fi
    make
    make man
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp "$srcdir/$_gitname/el" "${pkgdir}/usr/bin/el"
    cp "$srcdir/$_gitname/el.1" "${pkgdir}/usr/share/man/man1/el.1"
}
