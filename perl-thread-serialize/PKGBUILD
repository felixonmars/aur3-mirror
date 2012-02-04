# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-thread-serialize'
pkgver='0.11'
pkgrel='1'
pkgdesc="serialize data-structures between threads"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-load>=0.10')
url='http://search.cpan.org/dist/Thread-Serialize'
source=('http://search.cpan.org/CPAN/authors/id/E/EL/ELIZABETH/Thread-Serialize-0.11.tar.gz')
md5sums=('1a4991b95c47d9562acac8651498e22e')

build() {
  _DISTDIR="${srcdir}/Thread-Serialize-0.11"
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
