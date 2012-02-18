# Maintainer: Your Name <youremail@domain.com>
pkgname=plasma-ion-gismeteo
pkgver=0.1
_pkgcode=148397
pkgrel=2
epoch=
pkgdesc="Plasma Ion data provider for Gismeteo"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Plasma+Ion+data+provider+for+Gismeteo?content=148397"
license=('GPL')
groups=()
depends=('qlibxmlnodemodel' 'kdebase-workspace')
makedepends=('cmake' 'gcc-libs-multilib')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://kde-look.org/CONTENT/content-files/$_pkgcode-$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('d5d4910dbb7a0f0b9e426819515e8c0e') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
