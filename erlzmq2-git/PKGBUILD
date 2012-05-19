# Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>
_pkgname=erlzmq2
pkgname=$_pkgname-git
pkgver=20120520
pkgrel=1
pkgdesc="Erlang binding for 0MQ (ZeroMQ) (v2)"
arch=('i686' 'x86_64')
url="https://github.com/zeromq/erlzmq2"
license=('MIT')
depends=('erlang' 'zeromq-git')
makedepends=('git')

_gitroot="git://github.com/zeromq/erlzmq2.git"
_gitname="erlzmq2"
_optappver="2.0"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname --depth=1
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    make && make docs
}

package() {
    targetpath="$pkgdir/usr/lib/erlang/lib/$_pkgname-$_optappver"

    cd "$srcdir/$_gitname-build"
    mkdir -p "$targetpath"
    for folder in ebin src include doc priv test; do
        cp -R "$folder" "$targetpath/$folder"
    done
}

