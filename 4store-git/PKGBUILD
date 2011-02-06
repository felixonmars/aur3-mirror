# Contributor: Christophe Gueret <christophe.gueret@gmail.com>
pkgname=4store-git
pkgver=20100217
pkgrel=1
pkgdesc="4store is an efficient, scalable and stable RDF database"
arch=('i686' 'x86_64')
url="http://4store.org/"
license=('GPL')
depends=('raptor' 'rasqal' 'glib2' 'libxml2' 'pcre' 'ncurses' 'readline')
optdepends=('avahi')
makedepends=('git')
provides=('4store')
conflicts=('4store')

_gitroot="git://github.com/garlik/4store.git"
_gitname="4store"

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

  find -name 'Makefile' -exec sed -i'' -e's/local\///' {} \;

  ./configure
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
