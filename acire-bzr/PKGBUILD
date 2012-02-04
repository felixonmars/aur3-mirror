#; Contributor: Alessio 'alexwizard' Sergi <sergi.alessio@gmail.com>

pkgname=acire-bzr
_realname=acire
pkgver=85
pkgrel=1
pkgdesc="Browse Python code snippets quickly and easily."
arch=('i686' 'x86_64')
url="https://launchpad.net/acire"
license=('GPL')
depends=('pygtk' 'pygtksourceview2' 'pyxdg' 'dbus-python' 
'desktopcouch>=0.6.8' 'python-snippets-bzr>=99-4')
makedepends=('python2-distribute')
makedepends=('bzr' 'python')
install=($_realname.install)
provides=($_realname)
conflicts=($_realname)
_bzrtrunk=https://code.launchpad.net/~jonobacon/acire/trunk
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
    python2 setup.py install --root=$startdir/pkg || return 1

    # Replace python with python2
    cd $pkgdir/usr/bin || return 1
    sed -i 's/cmd\ =\ "\/usr\/bin\/python"/cmd\ =\ "\/usr\/bin\/python2"/g' acire || return 1

    cd $srcdir
    rm -rf $_bzrmod-build
}
