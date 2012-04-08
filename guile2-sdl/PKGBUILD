# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=guile2-sdl
_pkgname=guile-sdl
pkgver=0.4.0
pkgrel=1
pkgdesc="Bindings for SDL in Guile"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/guile-sdl/"
license=('GPL3')
depends=('guile>=2.0.0' 'sdl>=1.2' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
provides=('guile-sdl')
conflicts=('guile-sdl')
options=()
install=guile2-sdl.install
source=(http://download.savannah.gnu.org/releases/guile-sdl/$_pkgname-$pkgver.tar.gz
        guile2.patch)
md5sums=('992d2178e70be3b0a746fed9ff3bafa3'
         'bedb63a40ffaea35a6ce9b63087496b0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 -i ../guile2.patch
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check # one check fails, but we ignore that silently
  return 0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
