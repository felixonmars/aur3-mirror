# Maintainer: perlawk
pkgname=lci
pkgver=0.6
pkgrel=1
pkgdesc='LCI is an interpreter for the lambda calculus.'
url="http://lci.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
#options=(!strip)


source=( 
http://nchc.dl.sourceforge.net/project/lci/lci/$pkgver/$pkgname-$pkgver.tar.gz
)
build() {
		cd "$srcdir"/"$pkgname-$pkgver"
		./configure --prefix=/usr
    make 
}

package() {
		cd "$srcdir"/"$pkgname-$pkgver"
		make DESTDIR="$pkgdir" install
}

md5sums=('cf99c4592bddaa9de30099d42c6b5969')
