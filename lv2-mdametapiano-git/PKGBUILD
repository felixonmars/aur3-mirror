# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lv2-mdametapiano-git
pkgver=r113.9351e49
pkgrel=1
pkgdesc="Native LV2 port of the famous mda e-piano VSTi plugin"
arch=('i686' 'x86_64')
url="http://github.com/rekado/lv2-mdaMetaPiano"
license=('GPL')
depends=('lv2')
makedepends=('git' 'lvtk')
provides=(lv2-mda{,e}piano{,-git})
conflicts=(lv2-mda{,e}piano{,-git})
replaces=(lv2-mda{,e}piano{,-git})
source=("$pkgname::git+http://github.com/rekado/lv2-mdaMetaPiano.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname/src
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git clone $pkgname $pkgname-E
}

build() {
  cd $pkgname/src
  make

  cd "$srcdir/$pkgname-E/src"
  make TYPE=mdaEPiano
}

package() {
  cd $pkgname/src
  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install

  cd "$srcdir/$pkgname-E/src"
  make TYPE=mdaEPiano INSTALL_DIR="$pkgdir/usr/lib/lv2" install
} 
