pkgname='perl-facebook-graph'
pkgver='1.0401'
pkgrel='2'
pkgdesc="Facebook::Graph - A fast and easy way to integrate your apps with Facebook."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-datetime' 'perl-ouch' 'perl-uri' 'perl-datetime-format-strptime' 'perl-mozilla-ca' 'perl-any-moose' 'perl-lwp-protocol-https' 'perl-json' 'perl-mime-base64-urlsafe')
makedepends=()
url='http://search.cpan.org/dist/Facebook-Graph'
source=("http://search.cpan.org/CPAN/authors/id/R/RI/RIZEN/Facebook-Graph-$pkgver.tar.gz")
md5sums=('b4480aa3e39c4f16877fa4c21445586f')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Facebook-Graph-$pkgver" 
	patch ./t/03_public_query.t ../../03_public_query.t.diff 
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Facebook-Graph-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Facebook-Graph-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
