# Maintainer: Gordin <9ordin @t gmail dot com>
pkgname=cython-git
_gitname=cython
pkgver=0.19.324.gadd8091
pkgrel=1
pkgdesc="C-Extensions for Python - latest git master"
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python')
makedepends=('git')
provides=(cython)
conflicts=(cython)
source=('cython::git+https://github.com/cython/cython.git')
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  python setup.py install --root=$pkgdir || return 1
}

