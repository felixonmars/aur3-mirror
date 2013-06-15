# Maintainer: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
pkgname=mailfilter
pkgver=0.8.2
pkgrel=2
pkgdesc="A utility to get rid of unwanted spam mails, before downloading them from the POP3 mailbox."
arch=('i686' 'x86_64')
url="http://mailfilter.sourceforge.net/"
license=('GPL')
depends=('openssl')
source=("http://downloads.sourceforge.net/project/mailfilter/Mailfilter/0.8.2/mailfilter-0.8.2.tar.gz")
md5sums=('8af2615154a56d13069cc957de4bc338')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	CXXFLAGS=-fpermissive ./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
