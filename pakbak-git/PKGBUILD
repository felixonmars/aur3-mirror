# Maintainer: Giuliano Schneider <gs93@gmx.net>
pkgname=pakbak-git
_pkgname=pakbak
pkgver=1.0.0
pkgrel=1
pkgdesc="Back up the local pacman database when it changes"
arch=('any')
url="https://github.com/gs93/pakbak"
license=('GPL3')
depends=('bash' 'findutils' 'tar' 'systemd')
makedepends=()
source=()
install=$_pkgname.install

_gitroot="https://github.com/gs93/$_pkgname.git"
_gitname=$_pkgname

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
}

package() {
    cd "$srcdir/$_gitname-build"

    mkdir -p "$pkgdir/usr/lib/systemd/scripts"
    install -Dm755 pakbak_script "$pkgdir/usr/lib/systemd/scripts/pakbak"

    mkdir -p "$pkgdir/etc"
    install -Dm644 pakbak.conf "$pkgdir/etc/pakbak.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -Dm644 pakbak.service "$pkgdir/usr/lib/systemd/system/pakbak.service"
    install -Dm644 pakbak.path "$pkgdir/usr/lib/systemd/system/pakbak.path"
}
