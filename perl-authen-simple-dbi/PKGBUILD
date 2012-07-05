# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-authen-simple-dbi'
pkgver='0.2'
pkgrel='1'
pkgdesc="Simple DBI authentication"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-authen-simple>=0.3' 'perl-dbi')
makedepends=()
url='http://search.cpan.org/dist/Authen-Simple-DBI'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/Authen-Simple-DBI-0.2.tar.gz')
md5sums=('8ded220760b877ba09ffb2ec24b800fc')
sha512sums=('eb59a015feba85bf6ddc6438f6e3fc01b8a055b57ef290c5f2b793de3818946cacb7d75045b72bbc2547365136083c743dc3e7aeafb274b4384ba0a1e16fcdf2')
_distdir="${srcdir}/Authen-Simple-DBI-0.2"

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
