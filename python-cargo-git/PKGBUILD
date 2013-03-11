pkgname=python-cargo-git
pkgver=20130311
pkgrel=2
pkgdesc="borg general support modules"
arch=('i686' 'x86_64')
url="https://github.com/borg-project/cargo"
license=('MIT')
depends=('python' 'cython' 'python-numpy')
makedepends=('git' 'waf')
conflicts=('python-cargo')
provides=('python-cargo')

_gitroot="git://github.com/borg-project/cargo.git"
_gitname="cargo"

build() {

    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [[ -d $_gitname ]] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting waf..."
    rm -rf "$srcdir/$_gitname-build"
    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    2to3 -w .

    python waf configure
    python waf build
}

package() {
    cd "$srcdir/$_gitname-build"

    find -name "*.bak" -exec rm {} \; 

    DESTDIR="$pkgdir" python waf install
}
