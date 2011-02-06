# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Lex Rivera aka x-demon <aur@x-demon.org>                
# Maintainer: Lex Rivera aka x-demon <aur@x-demon.org>

pkgname=alleyoop
pkgver=0.9.7
pkgrel=1
pkgdesc="A Valgrind front-end for the GNOME environment"
arch=('i686' 'x86_64')
url="http://alleyoop.sourceforge.net"
license=('GPL')
depends=('valgrind' 'libgnomeui>=2.2.0')
install=alleyoop.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b45ab041dea15cd0ae663183bef893c6')

build() {
cd $srcdir/$pkgname-$pkgver

./configure --prefix=/usr --sysconfdir=/etc
make || return 1
make DESTDIR=$pkgdir install

install -m755 -d $pkgdir/usr/share/gconf/schemas
gconf-merge-schema $pkgdir/usr/share/gconf/schemas/$pkgname.schemas --domain alleyoop $pkgdir/etc/gconf/schemas/*.schemas || return 1
rm -rf $pkgdir/etc
}
