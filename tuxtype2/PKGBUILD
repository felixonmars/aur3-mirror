# Contributor: Tim Yang <tdy@gmx.com>
pkgname=tuxtype2
pkgver=1.5.3
pkgrel=2
pkgdesc="An educational typing tutorial game starring Tux"
arch=('i686' 'x86_64')
url="http://tuxtype.sourceforge.net/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
source=(http://downloads.sourceforge.net/tuxtype/tuxtype2-$pkgver.tar.bz2
        tuxtype2.desktop tuxtype2.diff)
md5sums=('ca04e65d3b19ddeeedb8a49147ed642b'
         '4e8b45e7a3a5a32e5c57505f2efa8664')

build() {
  cd "$srcdir/tuxtype2-$pkgver"
  patch -Np1 -i ../tuxtype2.diff || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
