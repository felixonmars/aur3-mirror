# Maintainer: Tom Guillen <freetoken at zoho dot com>
pkgname=python-trepan-git
pkgver=36cd6f7
pkgrel=1
pkgdesc="Pydbgr - Debugger, provides smart eval, granularity, event filtering and much more"
arch=('any')
url="http://code.google.com/p/python3-trepan/"
license=('GPL3')
depends=('python3')
makedepends=('git' 'python-pip')
install=$pkgname.install
_gitname=trepan
source=($_gitname::git+https://code.google.com/p/python3-trepan)
md5sums=('SKIP')

# automatically bump $pkgver with latest version from git
pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  # install pkg
  cd $_gitname
  python ./setup.py install --optimize=1 --root="${pkgdir}"
}
