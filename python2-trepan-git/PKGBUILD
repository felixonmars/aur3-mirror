# Maintainer: Tom Guillen <freetoken at zoho dot com>
pkgname=python2-trepan-git
pkgver=77900b2
pkgrel=1
pkgdesc="Pydbgr - Debugger, provides smart eval, granularity, event filtering and much more"
arch=('any')
url="http://code.google.com/p/pydbgr/"
license=('GPL3')
depends=('python2')
makedepends=('git' 'python2-pip')
install=$pkgname.install
_gitname=trepan
source=($_gitname::git+https://code.google.com/p/pydbgr)
md5sums=('SKIP')

# automatically bump $pkgver with latest version from git
pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  # install pkg
  cd $_gitname
  python2 ./setup.py install --optimize=1 --root="${pkgdir}"
}
