# Mantained by: Jens Staal <staal1978@gmail.com>

pkgname=pts-tcc-binary
pkgver=0.9.25
pkgrel=1
pkgdesc="A self-hosting minimal binary of the Tiny C compiler built with uClibc"
arch=('i686' 'x86_64')
url="http://ptspts.blogspot.com/2009/11/tiny-self-contained-c-compiler-using.html"
license=('GPL')
provides=('tcc')
source=('http://pts-mini-gpl.googlecode.com/svn/trunk/pts-tcc/pts-tcc-0.9.25')
md5sums=('acf01a4050af99e0eab03bab624e91bd')

package() {

install -m 755 -D $srcdir/pts-tcc-0.9.25 $pkgdir/usr/bin/pts-tcc
chmod -x $pkgdir/usr/bin/pts-tcc
# ln -s $pkgdir/usr/bin/pts-tcc $pkgdir/usr/bin/tcc #uncomment this row if you want this to be your tcc
    	
}

