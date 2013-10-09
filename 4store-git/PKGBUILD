# Maintainer: Leif Warner <abimelech@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>
pkgname=4store-git
pkgver=v1.1.5.51.g276c021
pkgrel=1
pkgdesc="4store is an efficient, scalable and stable RDF database"
arch=('i686' 'x86_64')
url="http://4store.org/"
license=('GPL')
depends=('rasqal>=0.9.22' 'avahi')
makedepends=('git')
provides=('4store')
conflicts=('4store')

source=("git://github.com/garlik/4store.git")
md5sums=('SKIP')
_gitname="4store"

pkgver() {
  cd "$srcdir/$_gitname/"
  local ver="$(git describe --long)"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"
  export LDFLAGS=${LDFLAGS//,--as-needed}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  msg "Avahi needs to be running to run tests."
  msg "As mentioned on their docs, this needs to be installed before tests will run."
  msg "(/var/lib/4store needs to exist, created by 'make install' http://4store.org/trac/wiki/Install#Testing)"
  msg "It's just a dir with perms set to 777, if you want to make it yourself."
  msg "Disable the 'check' function (!check) if you don't want to run tests."
  cd "$srcdir/$_gitname"
  make test
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
} 
