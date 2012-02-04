# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kevin McCarthy <me@kevinmccarthy.org>
pkgname=emailrelay
pkgver=1.8.2
pkgrel=1
pkgdesc="E-MailRelay is a simple SMTP proxy and relay MTA, written in C++, for Linux and Windows. As a proxy all messages can be passed through a user-defined program, such as a spam-filter, which can drop, readdress, or edit messages as they pass through."
arch=('i686' 'x86_64')
url="http://emailrelay.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=(gcc make)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://downloads.sourceforge.net/project/emailrelay/emailrelay/$pkgver/$pkgname-$pkgver-src.tar.gz)
noextract=()
md5sums=('957e61cbf6f8015cadef47f75866f35d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
  install -D -m644 etc/emailrelay.conf.template $startdir/pkg/etc/emailrelay.conf
  install -D -m755 bin/emailrelay.sh $startdir/pkg/etc/rc.d/emailrelay
 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
