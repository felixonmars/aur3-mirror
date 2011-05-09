# Maintainer: Artefact2 <artefact2@gmail.com>

pkgname=python2-jsonrpc-svn
pkgver=trunk
pkgrel=1
pkgdesc="A Python2 JSON-RPC implementation."
url="http://json-rpc.org/wiki/python-json-rpc"
license="unknown"
arch=(i686 x86_64)
depends=('python2')
makedepends=('subversion')

_svnrepo=http://svn.json-rpc.org/trunk/python-jsonrpc

build() {
    cd $srcdir

    msg "Connecting to the subversion server...."
    svn co $_svnrepo
	cd python-jsonrpc
    msg "Checkout done"

	mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"

	python2 setup.py install --install-purelib="$pkgdir/usr/lib/python2.7/site-packages/"
}
