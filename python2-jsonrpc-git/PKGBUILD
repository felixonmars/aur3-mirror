# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-jsonrpc-git
pkgver=20120413
pkgrel=1
pkgdesc="A Python JSON-RPC 2.0 Server"
arch=('any')
url="https://github.com/NCMI/jsonrpc"
license=('custom')
depends=('twisted' 'python2-pyopenssl')
makedepends=('git')

_gitroot='git://github.com/NCMI/jsonrpc.git'
_gitname='jsonrpc'

build() {
  if [ -d $_gitname ]; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
    cd $_gitname
  fi

  python2 setup.py build
}

package() {
  cd $_gitname

  python2 setup.py install --root=${pkgdir} --optimize=1
}
