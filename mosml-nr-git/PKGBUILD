# Maintainer: Andrew Gallant
pkgname=mosml-nr-git
pkgver=20120119
pkgrel=2
pkgdesc="Moscow ML compiler w/ changes from Norman Ramsey"
arch=('any')
license=('GPL')
url="http://www.itu.dk/~sestoft/mosml.html"
groups=()
makedepends=('git')
source=(http://www.cs.tufts.edu/~nr/drop/mosml.git)
noextract=()
install=
md5sums=('1753b39be70056ed8a7724cc49f98aee')

_gitbranch="nr"

build() {
  git clone mosml.git mosml
  cd mosml
  git checkout nr
  cd src
  make MOSMLHOME="/opt/mosml" world
  make MOSMLHOME="$pkgdir/opt/mosml" install
}
