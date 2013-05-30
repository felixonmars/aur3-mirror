# Maintainer: ogasser <oliver.gasser@gmail.com>
# Contributor: vti <viacheslav.t AT gmail.com>
pkgname=bitcoin-python-git
pkgver=v0.3.15.gf70d663
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries"
arch=('i686' 'x86_64')
url="https://github.com/laanwj/bitcoin-python"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('bitcoin-python')
conflicts=('bitcoin-python')
source=('git://github.com/laanwj/bitcoin-python.git')
md5sums=('SKIP')
_gitname='bitcoin-python'


pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

