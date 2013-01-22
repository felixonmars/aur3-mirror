# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-moosex-has-sugar'
pkgver='0.05070421'
pkgrel='1'
pkgdesc="Sugar Syntax for moose 'has' fields"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-sub-exporter')
makedepends=('perl-module-build>=0.4002' 'perl-moose' 'perl-moosex-types' 'perl-namespace-autoclean' 'perl-test-fatal')
url='http://search.cpan.org/dist/MooseX-Has-Sugar'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/MooseX-Has-Sugar-0.05070421.tar.gz')
md5sums=('b1ec5076919be03addd86b6344041531')
sha512sums=('56c897e5a5eeffc0ecbcb82542c244bac66aedecf88bcf1d7b4fc62bab1dc796715c69329d0625793148ede2f1665d69bb3df1ffb6e776f4136e8f4ed173ee40')
_distdir="${srcdir}/MooseX-Has-Sugar-0.05070421"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
