# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-thread-conveyor'
pkgver='0.19'
pkgrel='1'
pkgdesc="transport of any data-structure"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-load' 'perl-thread-serialize' 'perl-thread-tie>=0.09')
url='http://search.cpan.org/dist/Thread-Conveyor'
source=('http://search.cpan.org/CPAN/authors/id/E/EL/ELIZABETH/Thread-Conveyor-0.19.tar.gz')
md5sums=('055d48c4340649449af2306d37f0977f')

build() {
  _DISTDIR="${srcdir}/Thread-Conveyor-0.19"
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
