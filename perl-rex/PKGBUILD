# Contributor: senorsmile
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-rex'
pkgver='0.57.0'
pkgrel='1'
pkgdesc="Remote Execution"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=0' 'perl-digest-hmac>=0' 'perl-expect>=0' 'perl-http-date>=0' 'perl-json-xs>=0' 'perl-list-moreutils>=0' 'perl-net-ssh2>=0.33' 'perl-string-escape>=0' 'perl-xml-simple>=0' 'perl-yaml>=0' 'perl-libwww>=0')
makedepends=()
url='http://search.cpan.org/dist/Rex'
source=("http://search.cpan.org/CPAN/authors/id/J/JF/JFRIED/Rex-${pkgver}.tar.gz")
md5sums=('129e774e791bb36a73b38039b0cf19a9')
sha512sums=('ba2ca3733358a00a3fd41d1f6109641ede2b85e4ce6762dee806c09cc0aa15a412de84a11dd4b0e93dbc3870d78315753faf21be3aeecdabd7be8fa8c98e535a')
_distdir="Rex-${pkgver}"

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

