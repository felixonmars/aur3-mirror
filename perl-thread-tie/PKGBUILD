# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-thread-tie'
pkgver='0.13'
pkgrel='1'
pkgdesc="tie variables into a thread of their own"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-load>=0.11' 'perl-thread-serialize>=0.07')
url='http://search.cpan.org/dist/Thread-Tie'
source=('http://search.cpan.org/CPAN/authors/id/E/EL/ELIZABETH/Thread-Tie-0.13.tar.gz')
md5sums=('33ac1330b19d3cbf035b5d6b1c40c735')

build() {
  _DISTDIR="${srcdir}/Thread-Tie-0.13"
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
