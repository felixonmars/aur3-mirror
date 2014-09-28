# Maintainer: Alireza Savand <alireza.savand@gmail.com>

pkgname=h2o-git
pkgver=67bbbc3419
pkgrel=1
pkgdesc="HTTP server / library implementation with support for HTTP/1, HTTP/2, websocket"
arch=(any)
url="https://github.com/kazuho/h2o"
license=("custom")
makedepends=('git' 'openssl')
provides=("h2o")
conflicts=("h2o")

_gitroot="git://github.com/kazuho/h2o.git"
_gitname=h2o

build() {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
	  cd $_gitname
  else
	  git clone $_gitroot
	  cd $_gitname
  fi
  git submodule update --init --recursive

  cmake .
  make libh2o
  make h2o
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -Dm775 h2o "${pkgdir}/usr/bin/h2o"
  install -Dm644 libh2o.a "${pkgdir}/usr/lib/libh2o.a"
  mkdir -p "${pkgdir}/usr/include/libh2o/h2o"
  install -Dm775 include/*.h "${pkgdir}/usr/include/libh2o/"
  install -Dm775 include/h2o/*.h "${pkgdir}/usr/include/libh2o/h2o"
} 
