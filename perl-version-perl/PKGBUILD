# Contributor:  JSA <jsasys@gmail.com>

pkgname=perl-version-perl
_realname=Perl-Version
pkgver=1.009
pkgrel=1
pkgdesc="Perl::Version Module - Parse and manipulate Perl version strings"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/${_realname}-${pkgver}.tar.gz)
md5sums=('d54af4a652a7a3bc4b97aae3ff44104d')
 

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

