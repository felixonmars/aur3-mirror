pkgname=gopdit-qt4
_pkgname=${pkgname%-qt4}
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple program to cut and merge MPEG2-PS files at GOP boundaries without reencoding."
url="http://gopdit.ath.cx/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmpeg2' 'qt4')
source=(http://gopdit.ath.cx/$_pkgname-$pkgver.tar.gz)
md5sums=('90f3d4f83571444eedb9b143072aca61')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
#  patch -p1 < ../includes.patch
  LIBS="-lX11 -lXext" ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
