# Maintainer: Chris Sivanich <csivanich at gmail dot com>

_gitname='connman-notify'
_gitroot='https://github.com/csivanich/'$_gitname'.git'
_githash="3e2e263"

pkgname=connman-notify
pkgver=r1.$_githash
pkgrel=1
pkgdesc='Desktop notification integration for connman'
arch=(any)
url='https://github.com/wavexx/connman-notify'
license=('GPLV2')
groups=()
depends=('python2' 'python2-notify' 'python-dbus')
makedepends=('git')
optdepends=('dunst: lightweight notification daemon')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('.AURINFO' "$_gitroot")
noextract=()
sha256sums=('SKIP' 'SKIP')

build() {
    cd "$srcdir"
    msg "Connecting to Github...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are being updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "Git checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    git checkout "$_githash"
}

package() {
    cd "$srcdir/$_gitname-build"
    install -Dm755 connman-notify "${pkgdir}"/usr/bin/connman-notify
    install -Dm644 README.rst "${pkgdir}"/usr/share/doc/$pkgname
}
