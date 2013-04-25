# Maintainer: Scott Garrett <wintervenom@archlinux.us>
pkgname="python2-btce-api"
pkgver=20130424
pkgrel=1
pkgdesc="Python wrapper around the public and trading APIs of BTC-e.com."
arch=('i686' 'x86_64')
url="https://github.com/alanmcintyre/btce-api"
license=('unknown')
depends=('python2')

_gitroot="git://github.com/alanmcintyre/btce-api.git"
_gitname="btce-api"

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
    python2 setup.py build
}

package() {
    cd "$srcdir/$_gitname-build"
    mkdir -p $pkgdir/usr/bin
    python2 setup.py install --prefix "${pkgdir}/usr" --optimize=1
}

