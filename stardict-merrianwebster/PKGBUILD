# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=stardict-merrianwebster
pkgver=2.4.2
pkgrel=5
pkgdesc="Merrian Webster dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('f852de240f70165c6aad648e72f51e3c')
source=(http://ftp.vim.org/ftp/pub/ftp/os/FreeBSD/distfiles/stardict/$pkgname-$pkgver.tar.bz2)

build() {
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/stardict/dic/
}
