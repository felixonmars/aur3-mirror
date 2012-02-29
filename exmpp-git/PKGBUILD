# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Gunnar Kriik <gunnar.kriik@gmail.com>
pkgname=exmpp-git
pkgver=20120229
pkgrel=2
pkgdesc="Erlang XMPP library"
arch=('i686' 'x86_64')
url="http://www.process-one.net/en/labs/"
license=('GPL')
depends=('erlang' 'expat' 'openssl' 'zlib')
makedepends=('git' 'libtool')

_gitroot="http://github.com/processone/exmpp.git"
_gitname="exmpp"

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

  autoreconf -vif
  ./configure --prefix="$pkgdir"/usr/lib/erlang/lib
  make || return 1
  make install
} 
