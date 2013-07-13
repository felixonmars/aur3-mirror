_pack=secs3d
pkgname=octave-$_pack
pkgver=0.0.1
pkgrel=1
pkgdesc="A Drift-Diffusion simulator for 3d semiconductor devices"
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 2 or later')
depends=('octave>=3.2.4','octave-bim>=0.0.0','octave-fpl>=0.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('31320bb5b1bfddf0609af961407b8c1e')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}