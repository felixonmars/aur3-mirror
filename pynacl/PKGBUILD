pkgname=python2-nacl
arch=(i686 x86_64)
pkgver=20111208
pkgrel=1
pkgdesc="pynacl wrapper for the NaCl cryptography library"
url="https://github.com/k3d3/pynacl"
license=('Apache 2.0')
depends=('libnacl' 'git' 'swig' 'python2' 'python2-distribute')

_gitroot="git://github.com/k3d3/pynacl.git"
_gitname="pynacl"

build() {
    cd $srcdir

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    cd "$srcdir/$_gitname"

    msg "Building..."
    export NACL_DIR='.'
    export NACL_INCLUDE='/usr/include/nacl'
    export NACL_LIB='/usr/lib'
    python2 setup.py build
    msg "Installing..."
    python2 setup.py install --root="${pkgdir}"
    msg "Done."
}
