# Maintainer: AlexanderR <alexander r at gmx com>
pkgname=glues
pkgver=1.4
pkgrel=1
pkgdesc="GLU for OpenGL ES"
arch=('i686' 'x86_64')
url="https://code.google.com/p/$pkgname"
license=('Apache')
depends=('libgles')

source=("https://glues.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        'SDL_opengles.h')
md5sums=('370d2b28dc1e7839509b1c9368afffd6'
         '7306f50df3c102387e9bf91ae9667341')

build() {
  cd "$srcdir/$pkgname/source"

  install -D -m644 "$srcdir/SDL_opengles.h" SDL/SDL_opengles.h
 
  gcc *.c libtess/*.c -o libGLUES_CM.so -D__USE_SDL_GLES__ "-I$(pwd)" -I/usr/include/GLES/ -L/usr/lib/GLES $(pkg-config glesv1_cm --libs --static) -shared -fPIC
}

package() {
  cd "$srcdir/$pkgname/source"

  install -D -m644 glu.h "$pkgdir/usr/include/GLES/glu.h"
  install -D -m644 glues.h "$pkgdir/usr/include/GLES/glues.h"

  install -D -m644 libGLUES_CM.so "$pkgdir/usr/lib/libGLUES_CM.so"
}
