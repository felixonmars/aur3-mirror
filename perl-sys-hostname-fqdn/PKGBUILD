# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-sys-hostname-fqdn'
pkgver='0.11'
pkgrel='1'
pkgdesc="Get the short or long hostname"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Sys-Hostname-FQDN'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIKER/Sys-Hostname-FQDN-0.11.tar.gz')
md5sums=('a2a25b4ab650ec522f0e8c0527fdf8e5')
sha512sums=('5976e1facd5910346f02cc13e48de2df1fb2153433c9c98d667f50bce962e59eb176d08c93c455e37040cbad02e30bd98025cfb6b5cee10d6084084ae6ef7cf8')
_distdir="${srcdir}/Sys-Hostname-FQDN-0.11"

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
