# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-task-kensho'
pkgver='0.36'
pkgrel='1'
pkgdesc="A Glimpse at an Enlightened Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Task-Kensho'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Task-Kensho-0.36.tar.gz')
md5sums=('dc62ed831fa716dba6b6d1e5da44375e')
sha512sums=('f81d83fbc74c377ab755c09d252f11bca5176d7a6fbcabd7f21bcdae5cbcd3071851f76c3f356e958f3c96ca99a580d18d82d815dcb6dd78a7ddfa205d1ed294')
_distdir="Task-Kensho-0.36"

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
