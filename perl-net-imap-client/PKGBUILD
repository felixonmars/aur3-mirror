# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-net-imap-client
pkgver=0.9501
pkgrel=1
pkgdesc="Not so simple IMAP client library"
depends=('perl>=5.10.0' 'glibc' 'perl-io-socket-ssl' 'perl-list-moreutils')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Net-IMAP-Client"
source=(http://search.cpan.org/CPAN/authors/id/G/GA/GANGLION/Net-IMAP-Client-${pkgver}.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Net-IMAP-Client-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}
md5sums=('4d38189e2cdd525bf29126795bb7f594')
