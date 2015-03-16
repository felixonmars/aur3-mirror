# Contributor: Baptiste Careil <careil.baptiste@gmail.com>

_pkgname=cutesoul
pkgname="${_pkgname}-hg"
pkgver=r39.b976d59563b1
pkgrel=1
pkgdesc="Netsoul client in Qt/C++"
url="https://bitbucket.org/bcareil/cutesoul"
license=('BSD')
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('mercurial')
source=(hg+https://bitbucket.org/bcareil/cutesoul)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$_pkgname"
  qmake-qt4
  make
}

package () {
  cd "$_pkgname"
  install -D -m755 "CuteSoul" "$pkgdir/usr/bin/${_pkgname}"
}
