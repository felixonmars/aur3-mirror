# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-rest-client'
pkgver='249'
pkgrel='1'
pkgdesc="A simple client for interacting with RESTful http/https resources"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-crypt-ssleay' 'perl-libwww' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/REST-Client'
source=('http://search.cpan.org/CPAN/authors/id/M/MC/MCRAWFOR/REST-Client-249.tar.gz')
md5sums=('5846a73a800a42d164b59f919d03e247')
sha512sums=('a357318630926d80d76c77da2216263dd95395eb5b0099db01907406e3f28a01be48d570a6eafb94ae02faf90910ee5a186333030784945efe00cd63de65bbc9')
_distdir="${srcdir}/REST-Client-249"

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
