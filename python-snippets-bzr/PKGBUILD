# Contributor: Alessio 'alexwizard' Sergi <sergi.alessio@gmail.com>

pkgname=python-snippets-bzr
_realname=python-snippets
pkgver=99
pkgrel=4
pkgdesc="Lots of Python snippets that can be used to help understand how to code in Python."
arch=('any')
url="https://launchpad.net/python-snippets"
license=('GPL')
depends=()
makedepends=('bzr')
install=($_realname.install)
provides=($_realname)
conflicts=($_realname)
source=()
_bzrtrunk=https://code.launchpad.net/~jonobacon/python-snippets/trunk
_bzrmod=$pkgname
md5sums=()

build() {
    cd $srcdir

    msg "Connecting to the server...."

    if [ ! -d $_bzrmod/.bzr ]; then
        bzr co $_bzrtrunk $_bzrmod
    else
        bzr up $_bzrmod
    fi

    msg "Bazzar checktou done or server timeout"
    msg "Starting build package"
    rm -rf $_bzrmod-build || return 1
    mkdir -p $pkgdir/usr/share/ || return 1
    cp -r $_bzrmod $_bzrmod-build || return 1
    cd $_bzrmod-build || return 1

    # Replace python with python2
    for file in $(find $srcdir/$_bzrmod-build -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

    cd $srcdir
    
    cp -R $_bzrmod-build $pkgdir/usr/share/$_realname
}
