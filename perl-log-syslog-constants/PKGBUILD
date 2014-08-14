# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-log-syslog-constants'
pkgver='1.02'
pkgrel='1'
pkgdesc="Perl extension containing syslog priority constants as"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Log-Syslog-Constants'
source=('http://search.cpan.org/CPAN/authors/id/A/AT/ATHOMASON/Log-Syslog-Constants-1.02.tar.gz')
md5sums=('d8ca972af5695408d317d5f8447b4aa7')
sha512sums=('e975f075077a55fc0197049012cfd4748a0b8b86bef5ebb9859ebda6d7d3fad29a965e18af68033470e8761161426d633a854afe9ea7499a0ba5c946e2ff8e4c')
_distdir="Log-Syslog-Constants-1.02"

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
