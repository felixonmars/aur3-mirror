# Maintainer: Alex Davies <traverse.da@gmail.com>
pkgname=verse2-git
pkgver=r204.3459fe8
pkgrel=2
pkgdesc="Verse 2.0 is network protocol for real-time sharing of 3D data. It is successor of old Verse protocol developed at KTH. Verse 2.0 is still in alpha version."
arch=('any')
url="http://verse.github.io/"
license=('BSD' 'GPL')
groups=()
depends=('iniparser')
makedepends=('cmake' 'make')
optdepends=('python' 'python2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::'git+https://github.com/verse/verse.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$pkgname"

  mkdir ./build
  cd ./build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir/" install
}
