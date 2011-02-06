# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Nathan Owe <ndowens+AUR @ gmail.com>
pkgname=iplog
pkgver=2.2.3
pkgrel=4
pkgdesc="TCP/IP traffic logger"
url="http://ojnk.sourceforge.net/"
arch=('i686' 'x86_64')
depends=('libpcap')
license=('GPL')
source=(http://downloads.sourceforge.net/ojnk/$pkgname-$pkgver.tar.gz \
  2.2.3-DLT_LINUX_SSL.patch)
md5sums=('de98dd64018ab10ebe36e481cf00b7db' '48e8dfa989139e578e0ce8c35a090e39')

build() {
cd $srcdir/$pkgname-$pkgver
patch -Np1 -i ../2.2.3-DLT_LINUX_SSL.patch || return 1
./configure --prefix=/usr --mandir=/usr/share/man || return 1
make || return 1
make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install
}
