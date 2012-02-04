#Maintainer: Matthew Stewart <stewartmatthew6@gmail.com>
pkgname=sdlsasteroids
pkgver=3.01
pkgrel=1
pkgdesc="A remake of Sasteroids for modern hardware"
arch=('i686' 'x86_64')
url="http://sdlsas.sourceforge.net/"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'mesa')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://sourceforge.net/projects/sdlsas/files/SDL%20Sasteroids%20Source%20Releases/3.0.1/SDLSasteroids-3.0.1.tar.gz'
        'sbitmap.patch'
        'makefile.patch')
noextract=()
md5sums=('511d1ab59a2688bd618522c025a1f33b'
         '5a7ba1f27f00085d17cb6c602ed6e42b'
         '6abafed182d339883f84d4b266f436a3')

build() {
  cd $srcdir
  patch -p1 -i sbitmap.patch
  patch -p1 -i makefile.patch
  cd $srcdir/SDLSasteroids-3.0.1
  make
}

package() {
  cd $srcdir/SDLSasteroids-3.0.1
  make DESTDIR=$pkgdir install
}
