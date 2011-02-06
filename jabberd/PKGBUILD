# Contributor: Your Name <igor.mogielnicki@gmail.com>
pkgname=jabberd
pkgver=2.2.4
pkgrel=4
pkgdesc="XMPP Server"
arch=('i686')
url="http://jabberd2.xiaoka.com/"
license=('GPL')
groups=()
depends=('expat' 'udns' 'libidn' 'libgsasl')
makedepends=('expat' 'udns' 'libidn' 'libgsasl' 'openssl' 'mysql')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://ftp.xiaoka.com/jabberd2/releases/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=('91d5bc46063c50da49b81d7b7ea0bbab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/ \
  --exec-prefix=/usr \
  --sysconfdir=/etc/jabberd \
  --enable-mysql \
  --enable-ssl \
  --enable-idn

  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
