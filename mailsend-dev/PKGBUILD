# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=mailsend-dev
_pkgname=mailsend
pkgver=1.17b12
pkgrel=1
pkgdesc='Simple command line program to send mail via SMTP protocol.'
arch=('i686' 'x86_64')
url='https://code.google.com/p/mailsend/'
license=('GPL')
depends=('openssl')
provides=('mailsend')
conflicts=('mailsend')
source=("https://mailsend.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
sha256sums=('b09cf03c51888ff93b9539a44097d1cc261c66452a6d7a5350510367ddf82250')

build() {
	cd "$_pkgname-$pkgver"
	./configure --with-openssl=/usr
	make
}


package() {
	cd "$_pkgname-$pkgver"
	# DESTDIR is not supported by upsteam so do it ourselves
	# make DESTDIR="$pkgdir/" install

	install -Dm755 $_pkgname	"$pkgdir/usr/bin/$_pkgname"
	install -Dm644 doc/$_pkgname.1	"$pkgdir/usr/share/man/man1/$_pkgname.1"
}
