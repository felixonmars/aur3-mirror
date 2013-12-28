# maintainer perlaw

pkgname=ucb-scheme
_pkgname=stk
pkgver=1.3.6
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="UCB Scheme is a modified version of STk 4.0.1. Very good for learning scheme with the video course provided by U. Cal. Berkeley.  With codes and modifications for the books: Simply scheme and Exploring scheme.  Tools include Envdraw,stk-simply ... ."
url="http://www-inst.eecs.berkeley.edu/~scheme"
license=('GPL')
depends=()
source=(http://www-inst.eecs.berkeley.edu/~scheme/source/$_pkgname-$pkgver.tgz)

build() {
  cd $srcdir/$_pkgname
#stk part
	chmod +x configure
	CPPFLAGS='' CFLAGS='' CXXFLAGS='' LDFLAGS='' ./configure --prefix="$pkgdir"/usr 
	make 

#ucb part
	cd $srcdir/ucb
	sed -i 's/envdraw stkdb/envdraw/g;' Makefile.in
	./configure --prefix=$pkgdir/usr 
	make 
}

package() {
  cd $srcdir/$_pkgname
	make DESTDIR=$pkgdir/usr install
	mv $pkgdir/usr/bin/arch/Linux/* $pkgdir/usr/lib/stk/1.3.6/
  rm -rf $pkgdir/usr/bin/*

	cd $srcdir/ucb
	make DESTDIR=$pkgdir/usr install
	echo 'stk -load load-grfx "$@"' > $pkgdir/usr/bin/stk-grfx
  echo 'stk -load load-explorin "$@"' > $pkgdir/usr/bin/stk-explorin
  echo 'stk -load load-simply "$@"' > $pkgdir/usr/bin/stk-simply
}

md5sums=('b3941b397cb05e20eeae2f8245ca29f1')
