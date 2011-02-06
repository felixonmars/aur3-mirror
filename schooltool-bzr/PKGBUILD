# Maintainer: Kosava <kosava@archlinux.us>

pkgname=schooltool-bzr
pkgver=2733
pkgrel=1
pkgdesc="SchoolTool is a student information system for primary and secondary schools around the world."
arch=('i686' 'x86_64')
url="https://launchpad.net/schooltool"
license=('GPL')
depends=('zope-interface' 'python2-distribute')
makedepends=('python2')
conflicts=('schooltool')
_bzrtrunk=https://code.launchpad.net/schooltool/development
_bzrmod=$pkgname

build() {
    cd $srcdir

    msg "Connecting to the server...."
    if [ ! -d $_bzrmod/.bzr ]; then
        bzr co $_bzrtrunk $_bzrmod
    else
        bzr up $_bzrmod
    fi

    msg "Bazaar checkout dont or server timeout"

    if [ -d $_bzrmod-build ]; then
        rm -rf $_bzrmod-build
    fi
    cp -r $_bzrmod $_bzrmod-build
    msg "Starting make..."
    cd $_bzrmod-build
    python2 setup.py install --root=$pkgdir 

    # Replace python with python2
    cd $pkgdir/usr/bin 

    cd $srcdir
    rm -rf $_bzrmod-build
}