_pack=odebvp
pkgname=octave-$_pack
pkgver=1.0.6
pkgrel=1
pkgdesc="To approximate the solution of the boundary-value problem  y''=p(x)*y' + q(x)*y + r(x), aDetailsDependencies:Octave(>= 2.9.9)Autoload:Yes"
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 2 or later')
depends=('octave>=2.9.9')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('7ace0e26b6a4b1abed4959c73eeaf133')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}