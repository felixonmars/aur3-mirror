# Contributor: Nikolai Wyderka <nikolai [at] wyderka [dot] de>
pkgname=ttmine-bin
_pkgbase=ttmine
pkgver=0.51
pkgrel=1
pkgdesc="A console based minesweeper clone (binary version)"
arch=('i686' 'x86_64')
url="http://www.pspace.org/projects/36-programmes/55-ttmine-a-console-based-minesweeper-clone"
license=('WTFPL')
conflicts=('ttmine')
depends=()
makedepends=()
optdepends=()
install=
source=("http://www.pspace.org/downloads/$_pkgbase-$pkgver-$CARCH.tar.gz")
if [ "$CARCH" = "i686" ]; then
  md5sums=('8f912ac3a6fb4318090c6ea7b0150763')
  sha256sums=('e0aa4efed7266c054c937ce4cb4e8f97a8fea1832ff2cbed5b6355e68434cd7a')
 else
  md5sums=('de30849d71ebe49d3d884f42c564ba19')
  sha256sums=('93b1b82b52c2dcaa625dc0e6bd33ea4f10737eb5d42062fcd9eb00ef6a892450')
fi

build() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/bin/"
  cp ttmine-$pkgver ttmine "$pkgdir/usr/bin/"
}
