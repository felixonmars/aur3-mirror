#Contributor: Richard Murri <admin@richardmurri.com>
#Contributor: billycongo <billycongo@gmail.com>
pkgname=fetchyahoo
pkgver=2.14.8
pkgrel=1
pkgdesc="a perl script to download your Yahoo mail"
arch=(i686 x86_64)
url="http://fetchyahoo.sourceforge.net/"
license=('GPL')
depends=('perl' 'perl-mime-tools' 'perl-libwww' 'perl-lwp-protocol-https')
optdepends=('perl-crypt-ssleay: for https'
            'libnet: for mail forwarding'
            'perl-mail-imapclient: enable output to IMAP mailbox'
            'perl-io-socket-ssl: imap ssl logins')
source=(http://fetchyahoo.twizzler.org/$pkgname-$pkgver.tar.gz)

build()
{
  cd "${srcdir}/$pkgname-$pkgver"

  install -D fetchyahoo $pkgdir/usr/bin/fetchyahoo
  install -D fetchyahoorc $pkgdir/usr/share/doc/fetchyahoo/examples/fetchyahoorc
  install -D fetchyahoo.1 $pkgdir/usr/share/man/man1/fetchyahoo.1
}
md5sums=('d94700c6ade764880c09dfdaf7055463')
