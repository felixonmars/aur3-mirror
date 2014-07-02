# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-cpan-uploader'
pkgver='0.103007'
pkgrel='1'
pkgdesc="upload things to the CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-homedir>=0' 'perl-getopt-long-descriptive>=0.084' 'perl-http-message>=0' 'perl-lwp-protocol-https>=1' 'perl-term-readkey>=0' 'perl-libwww>=0')
makedepends=()
url='http://search.cpan.org/dist/CPAN-Uploader'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/CPAN-Uploader-0.103007.tar.gz')
md5sums=('a0e45898c6d981cd8232a37584644be4')
sha512sums=('6e84c4e7c31be844ec767a60138856ca11402e33ff2c8237a73a99eb8be2215ce6ea7c3e0a7cbafd29fc3afb42f52a915a2c6c2847fe9d3c8c96a92630b4dc47')
_distdir="CPAN-Uploader-0.103007"

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
