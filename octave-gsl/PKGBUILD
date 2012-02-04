# Maintainer: Caleb Reach <jtxx000@gmail.com>
_pack=gsl
pkgname=octave-$_pack
pkgver=1.0.8
pkgrel=1
pkgdesc="Octave bindings to the GNU Scientific Library"
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL')
groups=('octave-forge')
depends=('octave>2.9.9' 'gsl')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive" makefile-patch elliptic-patch)
# source=("http://downloads.sourceforge.net/octave/$_archive")
# noextract=("$_archive")
md5sums=('9f45ab71dc77b57646d6bfab5984cccd'
         '4bfcb455363146c8653086f9b2054db3'
         '1be05fa2f208a7f5acca2b9fbc689343')

build() {
  cd "$srcdir"
  mkdir -p builddir
  cat makefile-patch elliptic-patch | patch -p1 -d $_pack-$pkgver
  rm $_archive
  tar -czf $_archive $_pack-$pkgver
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
