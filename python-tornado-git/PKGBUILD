# Contributor: Anders Bergh <anders1@gmail.com>
# Maintainer: Frank Smit <frank/61924/nl>
pkgname=python-tornado-git
pkgver=20110313
pkgrel=2
pkgdesc="Open source scalable, non-blocking web server"
arch=(any)
url="http://www.tornadoweb.org"
license=("Apache")
depends=("python2>=2.6" "python-pycurl")
optdepends=("python-pycurl: to use the httpclient module")
makedepends=("git" "setuptools")
conflicts=("python-tornado")
replaces=("python-tornado")
provices=("python-tornado")

_gitroot="git://github.com/facebook/tornado.git"
_gitname="tornado"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
