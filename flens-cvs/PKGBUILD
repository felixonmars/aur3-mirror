# Maintainer: Raimar Sandner <raimar.sandner@uibk.ac.at>
pkgname=flens-cvs
pkgver=20131115
pkgrel=1
pkgdesc="FLENS - Flexible Library for Efficient Numerical Solutions."
arch=('i686' 'x86_64')
url="http://flens.sourceforge.net/legacy/"
license=('BSD')
depends=('cblas')
makedepends=('gcc' 'cvs')
optdepends=()
provides=('flens')
conflicts=('flens')
source=($pkgname-$pkgver.patch)
noextract=()
md5sums=('92055a87aadb5b604af299506587d8f1') #generate with 'makepkg -g'

_cvsroot=:pserver:anonymous:@flens.cvs.sourceforge.net:/cvsroot/flens
_cvsmod=FLENS-lite

do_patch() {
  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  do_patch

  #
  # BUILD HERE
  #
  cp config.ubuntu config
  make

}


package() {
	cd "$srcdir/$_cvsmod-build"
	make DESTDIR="$pkgdir/" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
