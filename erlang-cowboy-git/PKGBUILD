# Contributor: Shashwat Shikshu <nullorm@gmail.com>

pkgname=erlang-cowboy-git
pkgver=0.8.6
pkgrel=1
pkgdesc="Cowboy is a small, fast and modular HTTP server written in Erlang."
arch=('i686' 'x86_64')
url="https://github.com/extend/cowboy"
license=()
depends=('erlang')
makedepends=('git')

_gitroot="https://github.com/extend/cowboy.git"
_gitname="cowboy"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir"/$_gitname

  make || return 1
}
package(){
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp -R $_gitname/ebin "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
}