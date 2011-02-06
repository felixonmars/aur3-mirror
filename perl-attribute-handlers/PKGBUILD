# CPAN Name  : Attribute-Handlers
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-attribute-handlers'
pkgver='0.88'
pkgrel='1'
pkgdesc="Simpler definition of attribute handlers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Attribute-Handlers'
source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Attribute-Handlers-0.88.tar.gz')
md5sums=('cfc775abb5871adb25f4d292348ce5a9')

build() {
  DIST_DIR="${srcdir}/Attribute-Handlers-0.88"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&make test &&
    make DESTDIR="$pkgdir" install;  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
