# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.04
pkgname='perl-net-cidr-set'
pkgver='0.11'
pkgrel='1'
pkgdesc="Manipulate sets of IP addresses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Net-CIDR-Set'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/Net-CIDR-Set-0.11.tar.gz')
md5sums=('f80dc976b27de60cfbba1e6fb4a2b730')

build() {
  DIST_DIR="${srcdir}/Net-CIDR-Set-0.11"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    perl Build.PL &&
    perl Build &&
    perl Build test &&
    perl Build install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
