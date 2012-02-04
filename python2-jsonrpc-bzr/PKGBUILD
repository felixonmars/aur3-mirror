# Maintainer: Artefact2 <artefact2@gmail.com>

pkgname=python2-jsonrpc-bzr
pkgver=6
pkgrel=1
pkgdesc="A Python2 JSON-RPC implementation."
url="http://json-rpc.org/wiki/python-json-rpc"
license="LGPL"
arch=(i686 x86_64)
depends=('python2')
makedepends=('bzr')
source=('001-jsonrpc-2.0-no-error-in-response.patch')
md5sums=('e1fd9805e8eaeec5ec16c9e83dba5570')

_bzrrepo=http://bzr.json-rpc.org/trunk
_bzrmod=trunk/python-jsonrpc

build() {
    cd $srcdir

    msg "Connecting to the server...."

    if [ ! -d ${_bzrmod} ]; then
        bzr co ${_bzrrepo}
    else
        bzr up ${_bzrmod}
    fi

    rm -rf build
    cp -r ${_bzrmod} build
    cd build

    msg "BZR checkout done or server timeout"

    patch -p0 < ${startdir}/001-jsonrpc-2.0-no-error-in-response.patch

    mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"

    python2 setup.py install --install-purelib="$pkgdir/usr/lib/python2.7/site-packages/"
}
