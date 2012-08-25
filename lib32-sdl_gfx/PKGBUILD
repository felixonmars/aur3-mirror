# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com> 
     
pkgname=lib32-sdl_gfx
pkgver=2.0.24
pkgrel=1
pkgdesc="SDL Graphic Primitives"
url="http://www.ferzkopp.net/joomla/content/view/19/14/"
arch=('x86_64')
license=('LGPL')
depends=('lib32-sdl')
options=(!libtool)
makedepends=('gcc-multilib')
source=(http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${pkgver}.tar.gz)
md5sums=('838514185ff9a3b6377760aaa52fef8a')
     
build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd SDL_gfx-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd SDL_gfx-${pkgver}
  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/include
}
