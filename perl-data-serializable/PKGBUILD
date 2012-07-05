# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-data-serializable'
pkgver='0.40.1'
pkgrel='1'
pkgdesc="Moose role that adds serialization support to any class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-serializer' 'perl-json' 'perl-moose' 'perl-xml-simple')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Data-Serializable'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROBINS/Data-Serializable-0.40.1.tar.gz')
md5sums=('42f4651719a7802084034f1b9ab13990')
sha512sums=('8102cd338ab2fd97398396d6155b2abbb478624b4592e9a113a73305f3ac0e7307cf5c0180db71daa1bfdf91f863e4b0f53cb71a8966b8e80bd3d7c9cfb99460')
_distdir="${srcdir}/Data-Serializable-0.40.1"

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
