# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-data-util'
pkgver='0.59'
pkgrel='1'
pkgdesc="A selection of utilities for data and data types"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-hash-util-fieldhash-compat' 'perl-scope-guard' 'perl-test-exception>=0.27')
url='http://search.cpan.org/dist/Data-Util'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/Data-Util-0.59.tar.gz')
md5sums=('934f110ea17238f63e5f9acd0e98c013')
sha512sums=('141198d3567afa9526403925f9dd283139cab9ccc0324a79b501dae48f47f67782e490e871bbe793a454d40e9bdffe8c5c660952ebccdb9a295ec5fd391aeb6d')
_distdir="${srcdir}/Data-Util-0.59"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
