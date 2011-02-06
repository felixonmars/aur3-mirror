# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.16
pkgname='perl-markup-unified'
pkgver='0.01'
pkgrel='1'
pkgdesc="A simple, unified interface for markup langs"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-html-bbcode>=2.06' 'perl-moose' 'perl-text-markdown>=1.0.25' 'perl-text-textile>=2.12')
url='http://search.cpan.org/dist/Markup-Unified'
source=('http://search.cpan.org/CPAN/authors/id/I/ID/IDOPEREL/Markup-Unified-0.01.tar.gz')
md5sums=('6961f533d234b6c5acb0e30d503bbf44')

build() {
  _DISTDIR="${srcdir}/Markup-Unified-0.01"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
