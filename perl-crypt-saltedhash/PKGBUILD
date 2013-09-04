# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-crypt-saltedhash'
pkgver='0.09'
pkgrel='1'
pkgdesc="Working with salted hashes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-fatal')
url='http://search.cpan.org/dist/Crypt-SaltedHash'
source=('http://search.cpan.org/CPAN/authors/id/G/GS/GSHANK/Crypt-SaltedHash-0.09.tar.gz')
md5sums=('fe25faf1dd40c2a1aa07314da1f53dad')
sha512sums=('8bb4fd840a387e1062b7c1d0106f59a4f3dab7de05cdf3a93566e8e8370a73695fae3531e7184c7542302c82f932015a8112b3a47cde2a332025a2b243133ac7')
_distdir="Crypt-SaltedHash-0.09"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
