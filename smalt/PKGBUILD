# Maintainer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>
pkgname=smalt
pkgver=0.7.5
pkgrel=1
pkgdesc="SMALT efficiently aligns DNA sequencing reads with genomic reference sequences."
arch=('i686' 'x86_64')
url="http://www.sanger.ac.uk/resources/software/smalt"
license=('GPL')
source=(http://iweb.dl.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3440a48a0f525bf304883a9748ebe59a')

build() {
		cd $srcdir/$pkgname-$pkgver
		
		./configure --prefix=/usr
		make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
