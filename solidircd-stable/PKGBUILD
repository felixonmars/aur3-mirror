# Contributor: Nathan Owe. ndowens04 at gmail dot com
pkgname=solidircd-stable
pkgver=3.4.8
pkgrel=1
pkgdesc="Solid Internet Relay Chat Daemon based on bahamut IRCd"
arch=('i686')
url="http://www.solid-ircd.com"
license=('GPL')
depends=('openssl' 'bash')
source=(http://downloads.sourceforge.net/solidircd/$pkgname$pkgver.tar.gz)
md5sums=('45841450d6f13ad470a8dcd7da23c21b') 

build() {
  cd $srcdir/$pkgname
install -d $pkgdir/usr/share/$pkgname
  ./configure --prefix=$pkgdir/usr/share/$pkgname
ln -sf $pkgdir/usr/share/$pkgname/ircd $pkgdir/usr/bin/ircd || return 1
  make || return 1
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
