# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=forth-fsl
pkgver=20131015
pkgrel=1
epoch=
pkgdesc="The Forth Scientific Library"
arch=('i686' 'x86_64')
url="http://www.taygeta.com/fsl/sciforth.html"
license=('LGPL2.1')
groups=('forth')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.taygeta.com/fsl/library/Library.tgz)
sha512sums=('1d726d22299ac9459a34e368f4346c0d07734a0efb099289024ad5775d2fb92f5e9de874ebd736bfbe304a08a7b23e68a5fbce96b5359883e36991e0c354d052')

package() {
  cd "$srcdir/"
  # TODO: installation for other forths besides GForth according to guidelineds at http://ffl.googlecode.com/svn/trunk/README
  # Maybe symlink from a single location to the various library locations of different forths.
  mkdir -p $pkgdir/usr/share/gforth/site-forth/fsl # code
  mkdir -p $pkgdir/usr/share/doc/fsl # docs
  cp *.{f,fo,fs,fth,tst,seq} $pkgdir/usr/share/gforth/site-forth/fsl/
  cp *.txt $pkgdir/usr/share/doc/fsl/
}

# vim:set ts=2 sw=2 et:
