# Contributor: minimalist <minimalist@lavabit.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-www-pusher'
pkgver='0.06'
pkgrel='1'
pkgdesc="Interface to the Pusher WebSockets API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-json>=2' 'perl-libwww' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/WWW-Pusher'
source=('http://search.cpan.org/CPAN/authors/id/S/SQ/SQUEEK/WWW-Pusher-0.06.tar.gz')
md5sums=('214291523476f6db112124c95baeab09')
sha512sums=('b070e89f70babea16cab30b0defa902bdecb9a41445cf51ac2f4e4956aa40d8e4de1d37b368399fb3e5775b9c24f2b0ff967fa2aad033b5b096a79f9dc6ff432')
_distdir="${srcdir}/WWW-Pusher-0.06"

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
