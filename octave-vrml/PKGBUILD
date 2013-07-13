_pack=vrml
pkgname=octave-$_pack
pkgver=1.0.13
pkgrel=1
pkgdesc="3D graphics using VRML"
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPLv3+, GFDL')
depends=('octave>=2.9.7','-algebra>=0.0.0','octave-miscellaneous>=0.0.0','octave-struct>=0.0.0','octave-statistics>=0.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('79df290cea3f45e49eb58bfc664679b1')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}