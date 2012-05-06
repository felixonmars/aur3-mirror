# Maintainer: Holden Cox <segrived@gmail.com>
pkgname=notify-serve-git
pkgver=20120506
pkgrel=1
pkgdesc="Simple notification daemon"
arch=('any')
url=('https://github.com/jdeb/notify-serve')
license=('GPL')
depends=('perl' 'perl-net-dbus')
source=()
md5sums=()
conflicts=()

_gitroot=https://github.com/jdeb/notify-serve
_gitname=notify-serve

build() {
    cd ${srcdir}
    msg "Connecting to GIT server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"

    cd "$srcdir/$_gitname"
    install -Dm755 notify-serve "${pkgdir}/usr/bin/notify-serve"
}
