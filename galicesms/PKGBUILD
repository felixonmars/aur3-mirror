# Contributor: Niccolo' Forlini <nick@linuxbox360.org>
# Contributor: Francesco Piccinno <stack.box@gmail.com>
pkgname=galicesms
pkgver=1.62
pkgrel=1
pkgdesc="GTK2 GUI interface for sending SMS messages via Rosso Alice (Italian ADSL service)"
url="http://www.marzocca.net/linux/galicesms.html"
arch=('i686' 'x86_64')
license="unknown"
depends=('gtk2-perl' 'perl-libwww' 'perl-uri')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.marzocca.net/linux/downloads/galicesms-$pkgver.tar.gz)
md5sums=('bc4affacf061a8197a4e7e67e5b099fa')

build() {
install -D -m755 $pkgname $startdir/pkg/usr/bin/$pkgname
}
