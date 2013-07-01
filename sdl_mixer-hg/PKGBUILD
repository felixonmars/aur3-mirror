# Maintainer: Zachary Massia <zmassia@gmail.com>

pkgname=sdl_mixer-hg
pkgver=647.b3176bed9dcf
pkgrel=1
pkgdesc="Audio mixer add-on for SDL 2.0"
arch=('i686' 'x86_64')
url="http://www.libsdl.org/projects/SDL_mixer/"
license=('ZLIB')
depends=('sdl-hg' 'glibc')
makedepends=('mercurial')
options=(!libtool)
source=("$pkgname::hg+http://hg.libsdl.org/SDL_mixer")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd $srcdir/$pkgname
  sh autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
