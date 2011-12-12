#
# g++ bgi-sample.cpp -o bgi-sample \
#   -I/usr/include/boss/ \
#   `pkg-config --cflags sdl` \
#   -lboss -lSDL -lSDL_mixer -lSDL_ttf
#

pkgname=boss
pkgver=0.45
pkgrel=1
pkgdesc="BGI(Borland Graphics Interface) over SDL implementation"
arch=(i686 x86_64)
url="http://www.codedread.com/boss.php"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_ttf')
makedepends=('gcc' 'hd2u')
options=()
source=(http://www.codedread.com/boss-src-$pkgver.tar.gz
	build-fix.patch)
md5sums=('8017b80ce663e80c647915b6dbed4421'
         '078dde78f94a3e951001428e3fad7123')

build() {
  cd "$srcdir/boss"
  patch -p1 <$srcdir/build-fix.patch
  dos2unix include/boss.h
  cd src
  gcc -c boss.cpp -o boss.o -I../include/ `pkg-config --cflags sdl` `pkg-config --cflags SDL_ttf`
  ar q libboss.a boss.o
}

package() {
  cd "$srcdir/boss"
  install -Dm0644 src/libboss.a $pkgdir/usr/lib/libboss.a
  install -Dm0644 include/boss.h $pkgdir/usr/include/boss/graphics.h
}
