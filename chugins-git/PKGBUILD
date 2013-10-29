# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=chugins-git
pkgver=0.git82.d1f73c5
pkgrel=1
pkgdesc="A new way to extend ChucK"
arch=('i686' 'x86_64')
url="https://github.com/spencersalazar/chugins"
license=('GPL')
depends=('chuck')
provides=('chugins')
conflicts=('chugins')
source=("git+https://github.com/ccrma/chugins.git")
md5sums=('SKIP')

pkgver() {
  cd chugins
  echo "0.git$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd chugins
  make linux
}

package() {
  cd chugins
  make INSTALL_DIR="$pkgdir/usr/lib/chuck" install
}
