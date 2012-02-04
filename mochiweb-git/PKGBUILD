# Contributor: Gunnar Kriik <gunnar.kriik@gmail.com>

pkgname=mochiweb-git
pkgver=20100625
pkgrel=1
pkgdesc="MochiWeb is an Erlang library for building lightweight HTTP servers."
arch=('i686' 'x86_64')
url="http://github.com/mochi/mochiweb"
license=('MIT')
depends=('erlang')
makedepends=('git')

_gitroot="http://github.com/mochi/mochiweb.git"
_gitname="mochiweb"

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

  mkdir -p "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp * -R "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
}
