# For ArchLinux by Joël Porquet

pkgname=jpass
pkgver=1.0
pkgrel=1
pkgdesc="JPass password manager"
url="https://joel.porquet.org/wiki/hacking/jpass/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=(python)

_gitroot="https://joel.porquet.org/cgit/cgit.cgi/jpass.git/"
_gitname="jpass"

build() {
    msg 'Connecting to GIT server...'

    if [[ -d ${_gitname} ]]
    then
        cd ${_gitname}
        git pull
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg 'GIT checkout done or server timeout'
}

package() {
    cd "$srcdir/$_gitname"

    install -d "$pkgdir/usr/bin"
    install -m 0555 jpass.py "$pkgdir/usr/bin/jpass"
    install -d "$pkgdir/usr/share/doc/jpass"
    install -m 0444 jpass.conf.example "$pkgdir/usr/share/doc/jpass/"
}
