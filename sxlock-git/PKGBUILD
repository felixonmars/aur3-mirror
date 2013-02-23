# Maintainer: Jakub Klinkovsky <kuba.klinkovsky@gmail.com>

pkgname=sxlock-git
pkgver=20130223
pkgrel=1
pkgdesc="Simple screen locker utility for X, fork of sflock. Uses PAM authentication, no suid needed."
arch=('i686' 'x86_64')
url="https://github.com/lahwaacz/sxlock"
license=('MIT')
depends=('libxext')
makedepends=('git')

_gitroot="git://github.com/lahwaacz/sxlock.git"
_gitname="sxlock"

build() {
    cd "$srcdir"
  
    msg "Connecting to GIT server...."
  
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
        cd $_gitname
    fi
  
    msg "GIT checkout done or server timeout"
    msg "Starting install..."
  
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
