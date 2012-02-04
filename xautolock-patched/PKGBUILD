# Maintainer:  <vldmr@gmx.com>

pkgname=xautolock-patched
_pkgname=xautolock
pkgver=2.2
pkgrel=1
pkgdesc="An automatic X screen-locker/screen-saver (with lockaftersleep patch)"
arch=(i686 x86_64)
url="ftp://ibiblio.org/pub/Linux/X11/screensavers/"
license=('GPL2')
depends=('libxss')
makedepends=('imake')
source=("ftp://ibiblio.org/pub/Linux/X11/screensavers/$_pkgname-$pkgver.tgz"
		"xautolock-lockaftersleep.diff")

md5sums=('9526347a202694ad235d731d9d3de91f'
		 '34594ab12cbfdb401b937ab183619e41')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 < ../../xautolock-lockaftersleep.diff
  xmkmf
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR=${pkgdir}/ install
  make DESTDIR=${pkgdir}/ install.man
}
