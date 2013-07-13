_pack=video
pkgname=octave-$_pack
pkgver=1.0.2
pkgrel=1
pkgdesc="Implements addframe, avifile, aviinfo, and aviread, using ffmpeg. (and approximately conforms to Matlab interface)"
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('BSD')
depends=('octave>=2.9.12')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('e45e827ce5f409191aa9e9a61058e4ce')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}