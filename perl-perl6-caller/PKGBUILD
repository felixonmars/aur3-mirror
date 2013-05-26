# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-perl6-caller'
pkgver='0.100'
pkgrel='1'
pkgdesc="OO C<caller()> interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Perl6-Caller'
source=('http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Perl6-Caller-0.100.tar.gz')
md5sums=('d19ce32a9b7f7dfbb59aff7e38d476b9')
sha512sums=('9d2b1dd318015e00da488240e274fdc1b52eb49689c55bc436471b09fb161437316afe0da9d9bcbd25ba8a5f89c80c47b64664c09311f263fd01824a9e4d2d26')
_distdir="Perl6-Caller-0.100"

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
