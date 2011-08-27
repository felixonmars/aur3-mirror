# Maintainer: Košava <kosava@archlinux.us>

pkgname=entertainer-bzr
pkgver=413
pkgrel=1
pkgdesc="Simple and easy-to-use media center solution for GNOME and Xfce desktop environments."
arch=('i686' 'x86_64')
url="https://launchpad.net/entertainer"
license=('GPL')
depends=('pyclutter-gtk' 'pyclutter-gst' 'pycairo' 'cddb-py' 'imdbpy' 'python-eyed3' 'python-feedparser' 'pygobject' 'python-pysqlite' 'pyvorbis' 'python2-storm' 'twisted' 'pyxdg' 'python-imaging')
makedepends=('bzr' 'python2')
provides=('entertainer')
conflicts=('entertainer')
_bzrtrunk=https://code.launchpad.net/entertainer/trunk
_bzrmod=entertainer
install="entertainer.install"

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