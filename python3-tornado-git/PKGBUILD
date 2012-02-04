# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Frank Smit <frank/61924/nl>

pkgname=python3-tornado-git
pkgver=20110308
pkgrel=1
pkgdesc="Open source scalable, non-blocking web server"
arch=(any)
url="http://www.tornadoweb.org"
license=("Apache")
depends=("python" "python-pycurl")
makedepends=("git" "setuptools")
conflicts=("python-tornado")
replaces=("python-tornado")

_gitroot="git://github.com/facebook/tornado.git"
_gitname="tornado"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname
        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    git checkout -t origin/python3

    find tornado -name '*.py' -exec 2to3-3.2 -w -n {} \;

    python setup.py install --root="$pkgdir" --prefix=/usr
}
