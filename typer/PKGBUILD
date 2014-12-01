# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte__gmail>

pkgname=typer
pkgver=0.3.1
pkgrel=1
pkgdesc="A graphical typing trainer"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/typer/"
license=('GPL2')
depends=('libgnomekbd')
makedepends=('pkgconfig')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('4ad17c46852763f0e66f345f256729de')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}