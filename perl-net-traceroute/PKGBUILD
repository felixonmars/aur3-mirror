# Maintainer: Christian Berendt <berendt@b1-systems.de>

pkgname=perl-net-traceroute
_realname=Net-Traceroute
pkgver=1.10
pkgrel=1
pkgdesc="Perl module: This module implements traceroute(1) functionality for perl5"
arch=(i686 x86_64)
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
source=(http://search.cpan.org/CPAN/authors/id/H/HA/HAG/${_realname}-${pkgver}.tar.gz)
license=('unknown')
md5sums=('')
sha1sums=('ac00d63259de08f1d01bd8bac6df809dcc04a251')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}

# vim: ts=2 sw=2 et ft=sh
