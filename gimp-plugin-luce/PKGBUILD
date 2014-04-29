# Maintainer: Miles Summers <miles@youngearth.com.au>
pkgname=gimp-plugin-luce
pkgver=2.0.0
pkgrel=1
pkgdesc="This is a plug-in for GIMP to render a beautiful luminous halo."
arch=('i686' 'x86_64')
url="http://reddog.s35.xrea.com/wiki/Luce%20for%20GIMP.html"
license=('CC-by-nc-sa-3.0')
depends=('gimp')
makedepends=('gimp' 'intltool')
optdepends=()
conflicts=()
replaces=()
backup=()
provides=('gimp-plugin-luce')
source=("${pkgname}-${pkgver}.tar.xz::http://reddog.s35.xrea.com/software/luce-${pkgver}.tar.xz")
md5sums=('cbc59fbdb439424cd01e0299bee681ed')
build() {
  cd "$srcdir/luce-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/luce-$pkgver"

  make DESTDIR="$pkgdir/" install
}                
