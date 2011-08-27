# Maintainer: Christian Berendt <berendt@b1-systems.de>

pkgname=perl-net-traceroute-pureperl
_realname=Net-Traceroute-PurePerl
pkgver=0.10
pkgrel=1
pkgdesc="Perl module: traceroute(1) functionality in perl via raw sockets"
arch=(i686 x86_64)
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0' 'perl-net-traceroute')
source=(http://search.cpan.org/CPAN/authors/id/A/AH/AHOYING/${_realname}-${pkgver}.tar.gz)
license=('unknown')
md5sums=('')
sha1sums=('fb6044c4ce06b027ffb74531c5318e0c199f0395')

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
