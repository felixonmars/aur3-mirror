pkgname=perl-net-imap-simple-ssl
_realname=Net-IMAP-Simple-SSL
pkgver=1.3
pkgrel=2
pkgdesc="Net::IMAP::Simple::SSL - an secure simple IMAP access library"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-io-socket-ssl' 'perl-net-imap-simple' 'perl>=5.10.0')
options=(!emptydirs)
replaces=('net-imap-simple-ssl')
provides=('net-imap-simple-ssl')
source=(http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/${_realname}-${pkgver}.tar.gz)
md5sums=('86f5e996ff9adadbc849aadc351eca81')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}

