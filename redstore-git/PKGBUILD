# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>
pkgname=redstore-git
pkgver=20110916
pkgrel=1
pkgdesc="RedStore is a lightweight RDF triplestore written in C using the Redland library."
arch=('i686' 'x86_64')
url="http://www.aelius.com/njh/redstore/"
license=('GPL')
depends=('rasqal>=0.9.25' 'redland>=1.0.14' 'raptor>=2.0.1')
makedepends=('git')
conflicts=('redstore')
replaces=('redstore')

_gitroot="git://github.com/njh/redstore.git"
_gitname="redstore-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
