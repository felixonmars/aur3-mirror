# Maintainer:  GdelaRey <arch at delarey dot org>
# Contributor: Hugo Doria <ly50247@gmail.com>

pkgname=nmap-minimal
pkgver=6.40
pkgrel=1
pkgdesc="Utility for discovery and security auditing, minimal CLI version"
_realname=nmap
arch=('i686' 'x86_64')
url="http://nmap.org"
license=('GPL2')
depends=('pcre' 'libpcap')
options=('!makeflags')
provides=('nmap')
conflicts=('nmap' 'nmap-nogui')
source=("http://nmap.org/dist/$_realname-$pkgver.tar.bz2")
md5sums=('c0e2f3370e1fb97fb53185b15aa22aff')

build() {
  cd "$srcdir/$_realname-$pkgver"

  # Force usage of external libpcap
  # OSX bug check fails because of missing types
  # autoreconf fails because our autotools are too new (?)
  sed -i 's/have_libpcap=no/have_libpcap=yes/g' {.,ncat,nping}/configure

  ./configure --without-zenmap \
      --without-ndiff --without-nping --without-liblua --without-ncat \
      --without-openssl \
      --prefix=/usr --mandir=/usr/share/man \
      --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
