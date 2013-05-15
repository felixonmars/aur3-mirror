pkgname=libcppa-git
pkgver=V0.7.0
pkgrel=1
pkgdesc="C++11 Actors Library"
arch=('i686' 'x86_64')
url="https://github.com/Neverlord/libcppa"
license=('LGPL')
depends=('boost-libs')
makedepends=('git' 'boost' 'gcc')
source=("git+http://github.com/Neverlord/libcppa.git")
md5sums=('SKIP')
_gitname='libcppa'


pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  echo "Currently in $(pwd)"
  CXXFLAGS='-std=c++11 -Wextra -Wall -pedantic -pthread -O2 -g' ./configure --prefix=/usr 
  make
}

package() {
  cd $_gitname
  #make PREFIX=/usr DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir/" install
} 
