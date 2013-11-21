# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-par-packer'
pkgver='1.015'
pkgrel='1'
pkgdesc="PAR Packager"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1' 'perl-getopt-argvfile>=1.07' 'perl-module-scandeps>=1.09' 'perl-par>=1.005' 'perl-par-dist>=0.22' 'perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/PAR-Packer'
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSCHUPP/PAR-Packer-1.015.tar.gz')
md5sums=('851253c166c746d4c3968beaca5c49bc')
sha512sums=('f9957cfcfac73853e831f7c2c005892755e8a85ecd0d1a8c134c36c2b16351bc7dc5b51f1f96f5c3f91eb0ae16f867ea919db6b6547b76aafb67d5bce570fb4a')
_distdir="PAR-Packer-1.015"

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
