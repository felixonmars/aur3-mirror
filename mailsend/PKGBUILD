# Contributor: vn158 <vn158 at seznam dot cz> 
# with support from: graysky

pkgname=mailsend
pkgver=1.16
pkgrel=2
pkgdesc='Simple program to send mail via SMTP protocol with SSL, STARTTLS and Authentication support.'
arch=('i686' 'x86_64')
url=('https://code.google.com/p/mailsend/')
license=('GPL')
depends=('openssl')
conflicts=('mailsend-dev')
source=("https://mailsend.googlecode.com/files/mailsend${pkgver}.tar.gz")
sha256sums=('46e95d1ef03b6da4558cd9b4bae9a10b96970f853c8429902dced12d99583f6a')

build() {
 cd "$pkgname$pkgver"
 ./configure --with-openssl=/usr
 # force one thread else make fails on multicore machines
 make -j1
}

package() {
 cd "$pkgname$pkgver"
 install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
 install -dm755 "$pkgdir/usr/share/$pkgname"
 install -m644 {NOTES,README,TODO,ChangeLog} "$pkgdir/usr/share/$pkgname"
}
