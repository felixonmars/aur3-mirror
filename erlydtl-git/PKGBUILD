# Contributor: Vadim Shender <vadim@shender.org>

pkgname=erlydtl-git
pkgver=20130217
pkgrel=1
pkgdesc="Django templates for Erlang"
arch=('i686' 'x86_64')
url="http://github.com/evanmiller/erlydtl.git"
license=('MIT')
depends=('erlang')
makedepends=('git')

_gitroot="http://github.com/evanmiller/erlydtl.git"
_gitname="erlydtl"

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
  mkdir -p "$pkgdir"/usr/bin
  cp ebin priv -R "$pkgdir"/usr/lib/erlang/lib/"$_gitname"
  cp bin/erlydtl_compile "$pkgdir"/usr/bin/
}
