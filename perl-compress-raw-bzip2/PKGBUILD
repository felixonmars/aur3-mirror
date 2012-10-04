# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-compress-raw-bzip2'
pkgver='2.055'
pkgrel='1'
pkgdesc="Low-Level Interface to bzip2 compression library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Compress-Raw-Bzip2'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-2.055.tar.gz')
md5sums=('8490312f9c8b6b9f7ddefc9d832bbe38')
sha512sums=('54fc4741a91845bd38403682dc8a8c55783b3e1da3975c1f5e7f64f06fdad91ba9b276e65af71e666d125c2a370d4a6270a82e44e698cd88f35fcc1537cc2a40')
_distdir="${srcdir}/Compress-Raw-Bzip2-2.055"

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
