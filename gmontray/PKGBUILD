pkgname=gmontray
pkgver=0.4.4
pkgrel=1
pkgdesc="GTK Monitor Tray"
license=('GPL')
arch=('i686' 'x86_64')
url=http://sourceforge.net/projects/gmontray/files/
install=$pkgname.install
depends=(gtk2 libxslt)
source=(http://sourceforge.net/projects/gmontray/files/$pkgname-$pkgver.tar.gz)
md5sums=('986cb36b4e00ba27d085bf350934d1f7')

build(){
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
	make DESTDIR=$pkgdir install
}
