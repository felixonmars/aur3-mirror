# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname='perl-log-dispatch-filerotate'
pkgver='1.19'
pkgrel='1'
pkgdesc="Log to files that archive/rotate themselves"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-manip' 'perl-log-dispatch' 'perl-log-log4perl>=1.0' 'perl-params-validate')
makedepends=()
url='http://search.cpan.org/dist/Log-Dispatch-FileRotate'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARKPF/Log-Dispatch-FileRotate-1.19.tar.gz')
md5sums=('8fabfe387bb070580f7c97c18853ae25')
_distdir="${srcdir}/Log-Dispatch-FileRotate-1.19"

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
