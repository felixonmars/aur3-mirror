# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-mousex-attributehelpers'
pkgver='0.06'
pkgrel='1'
pkgdesc="Extend your attribute interfaces"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-any-moose>=0.10' 'perl-mouse' 'perl-test-data' 'perl-test-deep' 'perl-test-useallmodules')
url='http://search.cpan.org/dist/MouseX-AttributeHelpers'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MASAKI/MouseX-AttributeHelpers-0.06.tar.gz')
md5sums=('3c99db4f76b84fc5bfd79744bed4648f')

build() {
  _DISTDIR="${srcdir}/MouseX-AttributeHelpers-0.06"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -delete
  find "$pkgdir" -name perllocal.pod -delete
}
