# Maintainer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=fastx_toolkit
pkgver=0.0.14
pkgrel=1
pkgdesc="The FASTX-Toolkit is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing."
arch=('i686' 'x86_64')
url="http://hannonlab.cshl.edu/fastx_toolkit/"
license=('GPL')
source=(https://github.com/agordon/fastx_toolkit/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('bf1993c898626bb147de3d6695c20b40')
depends=('libgtextutils>=0.7')

package() {
		cd $srcdir/$pkgname-$pkgver		
		./configure --prefix="/usr"
		make DESTDIR="$pkgdir" install  
}
