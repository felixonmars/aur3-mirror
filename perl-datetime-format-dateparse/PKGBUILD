# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-datetime-format-dateparse'
pkgver='0.05'
pkgrel='2'
pkgdesc="Parses Date::Parse compatible formats"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.29' 'perl-datetime-timezone>=0.27' 'perl-timedate>=0')
makedepends=()
url='https://metacpan.org/release/DateTime-Format-DateParse'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHOBLITT/DateTime-Format-DateParse-0.05.tar.gz')
md5sums=('a9a66f74aeba7c45730430dbf9b37cfd')
sha512sums=('94ffb7ab016386d561d370a00180db490519e5f0f83529bf220484450851dbd88bf16a1f04b26fad31e8a4e36202dd1f905233b2d676b8bf92db2c212e636ad3')
_distdir="DateTime-Format-DateParse-0.05"

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
