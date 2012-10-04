# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-io-compress'
pkgver='2.055'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-raw-bzip2>=2.055' 'perl-compress-raw-zlib>=2.055')
makedepends=()
url='http://search.cpan.org/dist/IO-Compress'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-2.055.tar.gz')
md5sums=('79db12b733adae3655d50af5b14b7c30')
sha512sums=('e4e454c1e558a35b09449722ce1d629f0dc8f0c36d36973dee736c9bd489c30fdf74356de7492052f5b533f5ddbbe15344b7dc3fb26424854ea6d64b72ed82ad')
_distdir="${srcdir}/IO-Compress-2.055"

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
