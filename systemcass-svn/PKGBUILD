# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=systemcass-svn
pkgver=r56
pkgrel=1
pkgdesc="A fast cycle accurate SystemC simulator"
arch=('i686' 'x86_64')
url="https://www-asim.lip6.fr/trac/systemcass/"
license=('LGPL')
makedepends=('subversion' 'automake' 'autoconf' 'libtool')
options=(libtool)
source=("systemcass::svn+https://www.soclib.fr/svn/systemcass/sources")
md5sums=("SKIP")

build() {
  cd "$srcdir/systemcass"
  ./bootstrap || return 1
  ./configure --prefix=/opt/systemcass || return 1
  make || return 1
}

pkgver() {
  cd "$srcdir/systemcass"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
  cd "$srcdir/systemcass"
  make DESTDIR="$pkgdir/" install
}

