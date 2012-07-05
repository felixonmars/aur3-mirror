# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-moosex-clone'
pkgver='0.05'
pkgrel='1'
pkgdesc="Fine grained cloning support for Moose objects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-visitor>=0.24' 'perl-hash-util-fieldhash-compat' 'perl-moose>=0.74' 'perl-namespace-clean>=0.08')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/MooseX-Clone'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/MooseX-Clone-0.05.tar.gz')
md5sums=('ede55028ea2296aaa31232000a7e0c84')
sha512sums=('c82ce000b19359e62954e758af2c2f6b10a9d8ddc12d910c8e6d86c0874749ad1369552f8efcbb6810b5ab0b3c6ea6a84b598b28a5c03785c3a5a7697cac61a4')
_distdir="${srcdir}/MooseX-Clone-0.05"

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
