# Contributor: antzek9 <antze.k9 at googlemail dot com>
# Maintainer: antzek9
pkgname=r-patched
pkgver=2.11.1
pkgrel=2
arch=(i686 x86_64)
pkgdesc="Some patches to improve the speed of R. Some of these speed up 
particula functions; some reduce general interpretive overhead. The 
total speed improvement is substantial (speedups of 25% can be 
expected)."
url="http://www.cs.toronto.edu/~radford/R-mods.html"
license=('GPL')
groups=()
depends=()
makedepends=('gcc-fortran')
provides=('r')
conflicts=('r')
replaces=()
backup=()
options=()
install=
source=("http://mirrors.softliste.de/cran/src/base/R-2/R-2.11.1.tar.gz" 
"http://www.cs.toronto.edu/~radford/speed-patches.tar")
noextract=()
md5sums=('7421108ade3e9223263394b9bbe277ce' 
'b0c0a38a4f9f471589560f59b79fc75b')

build() {
  cd "$srcdir/R-$pkgver"

  echo "Applying speed up patches"
  ../speed-patches/apply-patches ../speed-patches/patch-*

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
