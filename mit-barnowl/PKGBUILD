# Maintainer: Pavel Panchekha <pavpanchekha@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=mit-barnowl
pkgver=1.7.1
pkgrel=1
pkgdesc="A console chat client for the AIM, IRC, Jabber, and Zephyr protocols"
arch=('i686' 'x86_64')
url="http://barnowl.mit.edu/"
license=('BSD' 'GPL')
depends=('glib2' 'heimdal' 'perl-authen-sasl' 'perl-digest-sha1'
         'perl-io-socket-ssl' 'perl-class-accessor' 'perl-net-dns'
         'perl-net-irc' 'perl-par' 'perl-text-autoformat' 'mit-zephyr')
makedepends=('zip')
install=barnowl.install
source=(http://barnowl.mit.edu/dist/barnowl-$pkgver-src.tgz)
md5sums=('ada0382d8449905f5480657b7342cc57')

build() {
  cd $srcdir/barnowl-$pkgver-src
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/barnowl-$pkgver-src
  make DESTDIR=$pkgdir install
  install -dm755 $pkgdir/usr/share/{barnowl/examples,doc/barnowl}
  install -m644 examples/* $pkgdir/usr/share/barnowl/examples/
  install -m644 doc/*.txt $pkgdir/usr/share/doc/barnowl/
  install -Dm644 doc/barnowl.1 "$pkgdir/usr/share/man/man1/barnowl.1"
  install -Dm644 COPYING $pkgdir/usr/share/licenses/barnowl/COPYING
}
