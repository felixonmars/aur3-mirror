# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Module author: Jon Allen
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-pod2pdf'
pkgver='0.42'
pkgrel='2'
pkgdesc="Converts documents written in Perl's POD (Plain Old Documentation) format to PDF files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-getopt-argvfile' 'perl-pdf-api2>=0.6')
optdepends=('perl-paper-specs: allows to specify paper sizes' 'perl-image-size: allows to use images' 'perl-file-type: allows to use images')
makedepends=()
url='http://search.cpan.org/dist/pod2pdf'
source=('http://search.cpan.org/CPAN/authors/id/J/JO/JONALLEN/pod2pdf-0.42.tar.gz')
md5sums=('8338b8a9ee16eedc295045af300801d9')
sha512sums=('f4d394ced8c8736e8003f20c1119e34eaf38ebc1f151ce2165e8198671ba569e1cb283ef1183ec54a5488868c2a087940d219824b574beddbe808be519a1bc69')
_distdir="pod2pdf-0.42"

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
