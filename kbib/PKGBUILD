# Maintainer: Peter Lewis <prlewis@letterboxes.org>
# Contributor: iztok pizorn <pizorn@gmail.com>

pkgname=kbib
pkgver=0.6.6
pkgrel=2
pkgdesc="A BibTex Editor for KDE 3"
url="http://users.tpg.com.au/thachly/kbib/index.html" 
makedepends=() 
depends=('qt3' 'kdelibs3' 'yaz' 'yazpp' 'poppler-qt3')
source=(http://users.tpg.com.au/thachly/$pkgname/$pkgname-$pkgver.tar.gz
        gcc-4.5.patch)
md5sums=('29f3903570228c58a90319332326ec2b'
         '475a8c0cfeeee69e7fb93428aaa779c5')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd $srcdir/$pkgname-$pkgver

	patch -p1 < ../gcc-4.5.patch

	# I didn't want arts, since I'm using KDE4 now...
	./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --without-arts

	make 
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
	# the kbib wants to install a file already provided by kdelibs
	find $pkgdir/opt/kde/share -name 'x-bibtex.desktop' -exec rm {} \;
}

