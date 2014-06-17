# Contributor: Eric Forgeot < http://esclinux.tk > 
pkgname=phlipple-svn
pkgver=0.8.5.r10
pkgrel=1
pkgdesc="A puzzle game which goal is to reduce a 3D shape to a single square. Elimination of squares is done by flipping edges around just like in a cardboard box."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/phlipple/"
license=('GPLv3')
depends=('sdl' 'glew' 'libvorbis')
provides=("phlipple")
conflicts=("phlipple")
source=("phlipple"::"svn+http://svn.code.sf.net/p/phlipple/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "0.8.5.r%s" "$(svnversion)"
}

build() {
	cd "$srcdir/${pkgname%-*}"
	./configure --prefix="/usr" CXX="g++" LIBS=-"lm"
	make || return 1
}
package() {
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="${pkgdir}" install
}
