# Maintainer: Matthew Hyatt <jacobfriar@gmail.com>

pkgname=oglplus-git
pkgver=20130422
pkgrel=1
pkgdesc="A C++ wrapper for openGL"
arch=('any')
url="http://oglplus.org/"
license=('Boost')
depends=('freeglut' 'glew')
makedepends=('git' 'freeglut' 'glew' 'cmake')
provides=('oglplus-git')

_gitroot=https://github.com/matus-chochlik/oglplus.git
_gitname=oglplus

build() {
  cd "$srcdir"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  ./configure.sh --prefix /usr --no-examples --no-docs
  
  cd _build
  
  make -j 3
}

package() {
  cd "$srcdir/$_gitname-build/_build"
  make DESTDIR="$pkgdir/" install
}
