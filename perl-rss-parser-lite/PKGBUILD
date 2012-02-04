# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-rss-parser-lite'
pkgver='0.10'
pkgrel='1'
pkgdesc=""
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/RSS-Parser-Lite'
source=('http://search.cpan.org/CPAN/authors/id/E/EB/EBOSRUP/RSS-Parser-Lite-0.10.tar.gz')
md5sums=('6457aac3c4033abe5ad7f4863cd85a7d')

build() {
  _DISTDIR="${srcdir}/RSS-Parser-Lite-0.10"
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
