pkgname=python2-borg-git
pkgver=20130313
pkgrel=1
pkgdesc="borg algorithm portfolio platform"
arch=('i686' 'x86_64')
url="https://github.com/borg-project/borg"
license=('MIT')
depends=('python2' 'cython2' 'python2-numpy' 'python2-cargo' 'plac' 'python2-scipy' 'python2-nose' 'scikits-learn')
makedepends=('git' 'waf')
conflicts=('python2-borg')
provides=('python2-borg')

_gitroot="git://github.com/borg-project/borg.git"
_gitname="borg"

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

    PYTHON=python2 python2 waf configure
    PYTHON=python2 python2 waf build
}

package() {
    cd "$srcdir/$_gitname-build"

    DESTDIR="$pkgdir" PYTHON=python2 python2 waf install
}
