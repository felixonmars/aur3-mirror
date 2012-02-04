# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=memorizer
pkgver=0.2
pkgrel=1
pkgdesc="Memorizer is a tool which helps in memorizing lists of data through on-screen flash cards and matching and multiple choice testing modes. It is designed for and by students studying for tests and exams."
arch=('i686' 'x86_64')
url="https://launchpad.net/memorizer"
license=('GPL2')
depends=('gtk2' 'librsvg')
source=(http://launchpad.net/memorizer/0.2/0.2/+download/$pkgname-$pkgver.tar.gz)
optdepends=('wordnet: for support large lexical database of English')
build() 
{
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	

} 
md5sums=('18ddfb3008f54e3b49e64d8193a9f1d7')
