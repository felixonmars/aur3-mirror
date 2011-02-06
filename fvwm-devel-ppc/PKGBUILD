# Contributor: Ruben Schuller <shiml@orgizm.net>
arch=('ppc')
pkgname=fvwm-devel-ppc
pkgver=2.5.26
pkgrel=1
pkgdesc="A multiple large virtual desktop window manager originally derived from twm, PKGBUILD for ppc"
makedepends=()
depends=('imlib' 'fribidi' 'perl' 'libstroke' 'libxft' 'libxpm' 'libxinerama' 'readline' 'librsvg')
provides=('fvwm-devel')
source=(ftp://ftp.fvwm.org/pub/fvwm/version-2/fvwm-$pkgver.tar.gz)
url="http://www.fvwm.org"
md5sums=('05a7795b872a47ec82117cc406d861d3')
license="GPL"

build() {

  cd $startdir/src/fvwm-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$startdir/pkg install  

}
