# Author: Juan Diego Tascon

pkgname=python2-txjsonrpc-bzr
pkgver=76
pkgrel=1
pkgdesc="JSON-RPC for Twisted"
arch=('any')
url="https://launchpad.net/txjsonrpc"
license=('GPL3')
depends=('python2' 'python-simplejson' 'twisted')
makedepends=('bzr')

_bzrmod=txjsonrpc
_bzrtrunk=lp:${_bzrmod}

build() {
  cd "$srcdir"
  msg "Getting source ..."
	if [ ! -d ./${_bzrmod} ]; then
		bzr branch ${_bzrtrunk}
	else
		bzr update ${_bzrtrunk}
	fi
  cd ${_bzrmod}
  msg "Checkout done or error"	
}

package() {
  cd "$srcdir/$_bzrmod"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
