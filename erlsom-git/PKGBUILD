# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=erlsom-git
pkgver=20110212
pkgrel=1
pkgdesc="XML parser for Erlang"
arch=('i686' 'x86_64')
url="https://github.com/dweldon/erlsom"
license=('LGPL')
depends=('erlang')
makedepends=('make' 'git')
optdepends=()
provides=('erlsom')

_gitroot="git://github.com/willemdj/erlsom.git"
_gitname="erlsom"

build() {
  cd "$srcdir"

  msg "Connecting to Git server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "Git checkout done or server timeout."
  msg "Starting make..."

  rm -rf $_gitname-build && cp -r $_gitname $_gitname-build && cd $_gitname-build

  chmod +x ./configure
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
}
