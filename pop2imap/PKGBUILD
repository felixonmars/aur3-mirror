# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=pop2imap
pkgver=1.18
pkgrel=1
pkgdesc="synchronize mailboxes between a pop and an imap servers"
arch=(i686 x86_64)
url="http://www.linux-france.org/prj/"
license=('GPL')
depends=('perl-date-manip' 'perl-email-simple' 'perl-io-socket-ssl' 'perl-mail-imapclient' 'perl-mail-pop3client')
#install=
source=(http://www.linux-france.org/prj/pop2imap/dist/$pkgname-$pkgver.tgz)
md5sums=('4a74a8493a97f06b3a4bfeb1303a248f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 pop2imap $pkgdir/usr/bin/pop2imap
}
# vim:set ts=2 sw=2 et:
