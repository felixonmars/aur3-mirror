# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=sparql-query-git
pkgver=20110928
pkgrel=1
pkgdesc="A command-line shell for accessing SPARQL endpoints over HTTP."
arch=('i686' 'x86_64')
url="http://github.com/tialaramex/sparql-query"
license=('GPL')
depends=('glib2' 'curl' 'libxml2')
makedepends=('git')
provides=('sparql-query')
conflicts=('sparql-query')

_gitroot="git://github.com/tialaramex/sparql-query.git"
_gitname="sparql-query"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  sed -i -e 's/usr\/local/usr/g' Makefile
  make 
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D sparql-update $pkgdir/usr/bin
}
