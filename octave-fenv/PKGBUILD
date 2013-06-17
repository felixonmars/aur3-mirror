_pack=fenv
pkgname=octave-$_pack
pkgver=0.1.0
pkgrel=1
pkgdesc="On supported architectures, change the rounding mode of the floating point arithmetics or change the precision of the arithmetical operations. Experimentally test the properties of the floating point arithmetics."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
md5sums=('db97ef4ca12b0c5fdb36e18079926a8c')

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
