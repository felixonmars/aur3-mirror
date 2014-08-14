# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-log-dispatch-file-rolling'
pkgver='1.09'
pkgrel='1'
pkgdesc="Object for logging to date/time/pid"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-dispatch>=2.37' 'perl-log-log4perl>=0.32')
makedepends=()
url='http://search.cpan.org/dist/Log-Dispatch-File-Rolling'
source=('http://search.cpan.org/CPAN/authors/id/J/JA/JACOB/Log-Dispatch-File-Rolling-1.09.tar.gz')
md5sums=('8e450d01d8331f0df06f682f0c3c7145')
sha512sums=('41db41807e5a9c7189cc340a6f325f1c7a41ada839902bc4563674893b0a9b6d27a0c6502fd53d58e4e6ea1f13757fb924ac6dee576b155035e48ba531139a32')
_distdir="Log-Dispatch-File-Rolling-1.09"

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
