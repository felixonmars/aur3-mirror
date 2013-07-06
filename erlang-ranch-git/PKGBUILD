# Contributor: Shashwat Shikshu <nullorm@gmail.com>

pkgname=erlang-ranch-git
pkgver=0.8.4
pkgrel=1
pkgdesc="Ranch is a socket acceptor pool for TCP protocols."
arch=('i686' 'x86_64')
url="https://github.com/extend/ranch"
license=()
depends=('erlang')
makedepends=('git')

_gitroot="https://github.com/extend/ranch.git"
_gitname="ranch"

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