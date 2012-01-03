# Contributor: Max Roder <maxroder@web.de>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-perlbal'
pkgver='1.79'
pkgrel='1'
pkgdesc="Reverse-proxy load balancer and webserver"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bsd-resource' 'perl-danga-socket>=1.44' 'perl-http-date' 'perl-http-message' 'perl-libwww' 'perl-sys-syscall')
makedepends=()
url='http://search.cpan.org/dist/Perlbal'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DORMANDO/Perlbal-1.79.tar.gz')
md5sums=('565ba843bd3b8b38287e20eceab62fe5')
sha512sums=('510ecb68ad3c4fd22e155dcc8b4473a0ec0e13163e2d2cf0e14b9e826c45ef07fd7fe9f0da6db6180c4afc3849c7e853d0531a272c39bb21aba0f84ecf7971a2')
_distdir="${srcdir}/Perlbal-1.79"

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
