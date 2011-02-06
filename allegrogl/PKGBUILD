# Contributor: Michal Krenek <mikos@sg1.cz>
# Maintainer: Matěj Týč <matej.tyc@gmail.com>

pkgname=allegrogl
pkgver=0.4.3
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Allegro add-on that allows you to use OpenGL alongside Allegro"
url="http://allegrogl.sourceforge.net"
depends=('allegro' 'mesa')
source=(http://downloads.sourceforge.net/sourceforge/allegrogl/alleggl-$pkgver.tar.gz 
	gcc_42.patch
	ldconfig_removal.patch)
md5sums=('7b9f58a5cf9b71890b9215f5d93142cf' 'ab02c3efdb0914595c7eb4da4135d70e' 'dd532132eb4390ae5ccec6bb900a7ee2')

build() {
  cd $startdir/src/alleggl
  patch -p0 < $startdir/src/gcc_42.patch
  patch -p0 < $startdir/src/ldconfig_removal.patch
  CFLAGS="$CFLAGS -DALLEGRO_NO_ASM" ./configure --prefix=/usr 
  CFLAGS="-DALLEGRO_NO_ASM" make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
