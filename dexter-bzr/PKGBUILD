# Maintainer: Košava <kosava@archlinux.us>

pkgname=dexter-bzr
_realname=dexter-rolodex
pkgver=354
pkgrel=1
pkgdesc="Address Book that goes hand in hand with Postler"
arch=('i686' 'x86_64')
url="https://launchpad.net/dexter-rolodex"
license=('GPL3')
depends=('enchant' 'python-distutils-extra' 'python-vobject' 'python-pyenchant' 'python2-storm' 'python2-pyenchant' 'pyxdg')
makedepends=('bzr' 'python2')
provides=('dexter')
conflicts=('dexter')
_bzrtrunk=https://code.launchpad.net/dexter-rolodex/trunk
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