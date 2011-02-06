# Maintainer Autor: Mikołaj Rydzewski <miki@ceti.pl>
# Contributor Zawart <zawart@gmail.com>
pkgname=sms-pl
pkgver=2.1.0
pkgrel=1
license=('GPL')
pkgdesc="Sms-pl is a apps for sending SMS messages to Polish mobile phone operator (Era, Plus, Orange, Heyah)"
arch=(i686)
url="http://ceti.pl/~miki/komputery/download/sms/readme.html"
depends=('pcre' 'openssl' 'pcrepp' 'curl' 'gdbm')
makedepends=('gcc' 'make')
install=sms.install
source=(http://ceti.pl/~miki/komputery/download/sms/sms-$pkgver.tar.gz)
md5sums=('dcbf973d5eaea710d31a65e6ca2fb6fb')
build() {
cd $startdir/src/sms-$pkgver
patch Makefile < ../../patch.Makefile || return 1
patch orangembox.cc < ../../patch.orangembox.cc || return 1
make || return 1
install -d -m 755 $startdir/pkg/usr/bin $startdir/pkg/usr/share/sms
install -s -m 755 sms smsaddr $startdir/pkg/usr/bin
install -m 644 README* $startdir/pkg/usr/share/sms
install -m 644 contrib/mimecut contrib/procmailrc contrib/sms-get $startdir/pkg/usr/share/sms
make DESTDIR=$startdir/pkg install
}
		   