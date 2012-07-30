# Maintainer: Guillaume DOTT <guillaume+aur@dott.fr>
pkgname='perl-config-scoped'
pkgver='0.22'
pkgrel='1'
pkgdesc="Feature rich configuration file parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.2' 'perl-error' 'perl-parse-recdescent>=1.94')
url='http://search.cpan.org/dist/Config-Scoped'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAISSMAI/Config-Scoped-0.22.tar.gz')
md5sums=('14d697b6a9cd938c6abfb9ed3272b6f0')

build() {
  cd "${srcdir}/Config-Scoped-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Build.PL &&
    ./Build &&
    ./Build test &&
    ./Build install; } || return 1

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
