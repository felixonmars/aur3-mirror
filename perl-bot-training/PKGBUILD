# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-bot-training'
pkgver='0.04'
pkgrel='1'
pkgdesc="Plain text training material for bots like Hailo and AI::MegaHAL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0' 'perl-dir-self>=0' 'perl-file-sharedir>=0' 'perl-file-slurp>=0' 'perl-moose>=0' 'perl-moosex-getopt>=0' 'perl-mouse>=0' 'perl-mousex-getopt>=0' 'perl-namespace-clean>=0')
makedepends=()
url='http://search.cpan.org/dist/Bot-Training'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Bot-Training-0.04.tar.gz')
md5sums=('c28433455495348b578385a1c94b8ed8')
sha512sums=('95d180b15d065fda1e71c477e1e0fc843bf6f4b424f4437e1eee9e40b927e1b939d2e08fd1e3413894a1e77a4d67177ac83119373eecafa45a8b0902dc81d146')
_distdir="Bot-Training-0.04"

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
