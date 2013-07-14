_pack=econometrics
pkgname=octave-$_pack
pkgver=1.1.1
pkgrel=2
pkgdesc="Econometrics functions including MLE and GMM based techniques."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL3')
depends=('octave>=2.9.7','octave-optim>=0.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('132e64c97c21dd2841f3f1957b3ffc16')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}