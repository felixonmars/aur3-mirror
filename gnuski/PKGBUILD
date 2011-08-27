# Contributor: Hendrik L. kampsuniahv [at] gmail dot com

pkgname=gnuski
pkgver=0.3
pkgrel=1
pkgdesc="Open source clone of Skifree, the old Windows game. It currently uses NCurses for graphics."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnuski/"
license=('GPL')
depends=('ncurses')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('afaae9ff88292bce9a7f4e4682099315')

build() {
	  cd $srcdir/$pkgname
	      make || return 1

	      install -m755 -D $pkgname $pkgdir/usr/bin/$pkgname || return 1
	}
