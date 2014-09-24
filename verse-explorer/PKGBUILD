# Maintainer: Alex Davies <traverse.da@gmail.com>
pkgname='verse-explorer'
pkgver=r5.203863c
pkgrel=1
pkgdesc="Qt based Verse client used for managing shared data. "
arch=('any')
url="https://github.com/jirihnidek/verse-explorer"
license=('GPL')
groups=()
depends=('verse2-git')
makedepends=('qtchooser' 'make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::'git+https://github.com/jirihnidek/verse-explorer.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname/"

  make DESTDIR="$pkgdir/" install
}
