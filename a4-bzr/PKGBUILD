# Maintainer: Košava <kosava@archlinux.us>

pkgname=a4-bzr
pkgver=79
pkgrel=1
pkgdesc="A4 is an editor and viewer of presentations."
arch=('i686' 'x86_64')
url="https://launchpad.net/a4"
license=('GPL3')
depends=('pygtk' 'python-rsvg' 'python-pyenchant' 'python2-numpy' 'python-lxml')
makedepends=('bzr' 'python2')
conflicts=('a4')
_bzrtrunk=https://code.launchpad.net/a4/trunk
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