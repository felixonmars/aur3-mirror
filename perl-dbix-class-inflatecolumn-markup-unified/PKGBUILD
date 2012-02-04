# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-dbix-class-inflatecolumn-markup-unified'
pkgver='0.021'
pkgrel='1'
pkgdesc="Automatically formats a text column"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-dbix-class>=0.07005' 'perl-markup-unified')
url='http://search.cpan.org/dist/DBIx-Class-InflateColumn-Markup-Unified'
source=('http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/DBIx-Class-InflateColumn-Markup-Unified-0.021.tar.gz')
md5sums=('173bd8220997f2d9e8f5d50de41b32f4')

build() {
  _DISTDIR="${srcdir}/DBIx-Class-InflateColumn-Markup-Unified-0.021"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
