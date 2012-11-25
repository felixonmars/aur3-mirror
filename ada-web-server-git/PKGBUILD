# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Patrick Kelly <kameo76890@gmail.com>

_pkgname=aws
pkgname=ada-web-server-git
pkgver=20121124
pkgrel=1
pkgdesc="A complete, Ada-based, embeddable Web application framework"
arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(GPL)
groups=(gcc-ada)
depends=(gcc-ada)
makedepends=(git gprbuild)
provides=($_pkgname ada-web-server)
conflicts=($_pkgname ada-web-server)

_gitroot=https://forge.open-do.org/anonscm/git/$_pkgname/$_pkgname.git
_gitname=$_pkgname

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [[ -d $_gitname/.git ]]; then
        pushd $_gitname && git pull
        msg2 "The local files are updated."
        popd
    else
        git clone --recursive $_gitroot
    fi
    msg2 "GIT checkout done or server timeout"

    rm -rf $_gitname-build/
    cp -r $_gitname/ $_gitname-build/
    cd $_gitname-build/

    msg "Building..."
    make setup build
}

package() {
    cd "$srcdir"/$_gitname-build/
    make DESTDIR="$pkgdir" install
}
