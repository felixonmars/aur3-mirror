# Maintainer: Thibaut Horel <thibaut dot horel at gmail dot com>
_gitname=znc-push
pkgname=$_gitname
pkgrel=1
pkgver=20130301
pkgdesc='A module to send push notifications on various events to push services like Boxcar, NMA, Notifo, Pushover, Prowl, and Supertoasty.'
arch=(i686 x86_64)
url=http://noswap.com/projects/znc-push
license=('MIT')
depends=(znc)
makedepends=(znc)
source=('git+https://github.com/jreese/znc-push.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    cd "$srcdir/$_gitname"
    znc-buildmod push.cpp
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 push.so "$pkgdir/usr/lib/znc/push.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
