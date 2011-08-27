# Contributor: Gunnar Kriik <gunnar.kriik@gmail.com>

pkgname=emongo-git
pkgver=20100602
pkgrel=1
pkgdesc="Erlang interface for MongoDB - The most Emo of mongo drivers"
arch=('i686' 'x86_64')
url="http://github.com/JacobVorreuter/emongo"
license=('GPL')
depends=('erlang' 'mongodb')
makedepends=('git')

_gitroot="http://github.com/JacobVorreuter/emongo.git"
_gitname="emongo"

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
  cp -R ebin/ "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp -R src "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp -R include "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp -R priv "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp -R t "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
}
