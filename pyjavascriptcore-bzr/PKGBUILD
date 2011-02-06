# Maintainer: sbillaudelle <stein@cream-project.org>

pkgname=pyjavascriptcore-bzr
pkgver=62
pkgrel=2
pkgdesc="Use Python to tap into the whole power of WebKit."
arch=('i686' 'x86_64')
url="https://launchpad.net/pyjavascriptcore"
license=('LGPL')
depends=('cython')
makedepends=('bzr')
source=()
md5sums=()

_bzrtrunk=lp:pyjavascriptcore
_bzrmod=trunk

build()
{
    cd $srcdir/

    msg "Connecting to the server..."

    if [ ! -d ./${_bzrmod} ]; then
        bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
    else
        bzr up ${_bzrmod}
    fi
    
    msg "BZR checkout done or server timeout."

    cd ${_bzrmod}
    
    python setup.py install --prefix=/usr --root="$pkgdir" || return
}
