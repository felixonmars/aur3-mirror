# Contributor: Eric Forgeot < http://esclinux.tk > 
pkgname=phlipple
pkgver=0.8.5
pkgrel=1
pkgdesc="A puzzle game which goal is to reduce a 3D shape to a single square. Elimination of squares is done by flipping edges around just like in a cardboard box."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/phlipple/"
license=('GPLv3')
depends=('sdl' 'glew' 'libvorbis')
conflicts=("phlipple-svn")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7bd89bda63fd6534df58565f336ef1d2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix="/usr" CXX="g++" LIBS=-"lm"
	make || return 1
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
