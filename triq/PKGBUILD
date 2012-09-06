# Maintainer: evnu
pkgname=triq
pkgver=20120906
pkgrel=1
pkgdesc="Trifork QuickCheck for Erlang "
arch=('i686' 'x86_64')
url="https://github.com/krestenkrab/triq.git"
license=('APACHE')
depends=('erlang')
makedepends=('git')
provides=('triq')
conflicts=()

_gitroot="https://github.com/krestenkrab/triq.git"
_gitname="triq"
_pkgname="triq"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ]; then
        cd $srcdir/$_gitname && git pull origin
        cd -
    else
        git clone $_gitroot $_gitname
        git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    fi

    msg "Building triq"

    cd "$srcdir/$_gitname-build"
    make || return 1

    # get version
    _app_version=$(grep vsn ebin/triq.app | awk -F, '{print $2;}' | sed 's/["}]//g')

    install -d $pkgdir/usr/lib/erlang/lib/triq-$_app_version/
    msg "Copying files"
    cp -r "include" "ebin" "src" $pkgdir/usr/lib/erlang/lib/triq-$_app_version
}

