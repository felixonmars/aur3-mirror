# Packager: Brad Fanella <bradfanella@gmail.com>
pkgname=plasma-stock-quote
_pkgname=plasma_stock_quote
pkgver=2.1
pkgrel=2
pkgdesc="Displays stock quotes on the desktop pulled from Yahoo. Rewrite of stockoid." 
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Stock+Quote?content=90695"
license=('GPL')
depends=('kdebase-plasma>=4.1.0')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/90695-plasma_stock_quote-2.1.tar.bz2)
md5sums=('ec2099065da1b61bcc8d6c435b87ca79')

build() {
	cd $srcdir/$_pkgname-$pkgver
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
	make DESTDIR=$startdir/pkg install


}
