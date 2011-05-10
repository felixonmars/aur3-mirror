# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-net-openvpn-manage'
pkgver='0.02'
pkgrel='1'
pkgdesc="Interact with an OpenVPN management port"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Net-OpenVPN-Manage'
source=('http://search.cpan.org/CPAN/authors/id/M/ME/MEYEAARD/Net-OpenVPN-Manage-0.02.tar.gz')
md5sums=('c66ecde8970856a2e76ca3882fc52dc2')
_distdir="${srcdir}/Net-OpenVPN-Manage-0.02"

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
