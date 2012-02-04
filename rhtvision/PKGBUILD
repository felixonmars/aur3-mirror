# Contributor:  Leslie P. Polzer <polzer@gnu.org>
pkgname=rhtvision
pkgver=2.0.3
pkgrel=1
pkgdesc="Enhanced port of Turbo Vision TUI library"
url="http://tvision.sf.net/"
license=""
depends=(gpm gcc libxmu)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=($pkgname-$pkgver.src.tar.gz)
md5sums=(b6129f5c510ba9d28d21c9575b7e1c75)

build() {
  cd $startdir/src/tvision
  patch -Np0 < $startdir/fpbase.cc.patch
  ./configure --prefix=/usr --with-debug
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name "*.la" -exec rm -f '{}' \;
}
