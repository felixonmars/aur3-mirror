_pack=dicom
pkgname=octave-$_pack
pkgver=0.1.1
pkgrel=1
pkgdesc="Digital communications in medicine (DICOM) file io. Depends on Grassroots DICOM (GDCM). This package is not available in repos for all distros. Contributors: Judd Storrs, Kris Thielemans."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 3 or later')
depends=()
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('93f5667502c5f7376f2588fec35eb0de')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}