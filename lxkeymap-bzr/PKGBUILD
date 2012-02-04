pkgname=lxkeymap-bzr
pkgver=14
pkgrel=1
pkgdesc="LXKeymap is an application that allows you to easily switch between keyboard layouts."
arch=('i686' 'x86_64')
url="https://launchpad.net/lxkeymap"
license=('GPL3')
depends=('python-xklavier' 'pygtk')
makedepends=('bzr' 'python2' 'python-distutils-extra')
conflicts=('a4')
_bzrtrunk=https://code.launchpad.net/lxkeymap/trunk
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

    cd $srcdir
    rm -rf $_bzrmod-build
}
