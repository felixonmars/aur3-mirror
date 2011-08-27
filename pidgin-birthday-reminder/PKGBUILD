# Contributer: markuman <markuman@gmail.com> 

pkgname=pidgin-birthday-reminder
pkgver=1.7
pkgrel=1
pkgdesc="Pidgin Birthday Reminder Plugin"
url="https://launchpad.net/pidgin-birthday-reminder"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'pidgin')
makedepends=('intltool')
source=(http://launchpad.net/pidgin-birthday-reminder/trunk/$pkgver/+download/pidgin-birthday-reminder-$pkgver.tar.gz)
md5sums=(de90fa450baabb41422f323a75a6a7ac)

build() {
cd $srcdir/pidgin-birthday-reminder-$pkgver
./configure --prefix=/usr --mandir=/usr/share/man
make || return 1
make DESTDIR=$pkgdir install
}
