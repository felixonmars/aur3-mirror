# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgname=magicpoint
pkgname=$_pkgname-snapshot
pkgver=20100920
pkgrel=2
pkgdesc="An X11 based presentation tool"
arch=(i686 x86_64)
url="http://member.wide.ad.jp/wg/mgp/"
license=('GPL')
depends=('libmng' 'libxft' 'libxmu' 'imlib2' 'perl')
makedepends=('imake' 'bison' 'flex')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(ftp://sh.wide.ad.jp/WIDE/free-ware/mgp-snap/mgp-snap-$pkgver.tar.gz)
md5sums=('f84724ba47306339b3782aa5abc6087a')

build() {
  cd "$srcdir/kit"

  ./configure --prefix=/usr
  xmkmf
  make Makefiles
  make
}

package() {
  cd "$srcdir/kit"

  make DESTDIR="$pkgdir/usr" MANPATH="/share/man" install install.man
}

# vim:set ts=2 sw=2 et:
