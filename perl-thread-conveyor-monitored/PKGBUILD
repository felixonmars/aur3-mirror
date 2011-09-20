# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-thread-conveyor-monitored'
pkgver='0.14'
pkgrel='1'
pkgdesc="monitor a belt for specific content"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-load' 'perl-thread-conveyor>=0.15')
url='http://search.cpan.org/dist/Thread-Conveyor-Monitored'
source=('http://search.cpan.org/CPAN/authors/id/E/EL/ELIZABETH/Thread-Conveyor-Monitored-0.14.tar.gz')
md5sums=('aa85a7ec234365485fcffbddcca9b05f')

build() {
  _DISTDIR="${srcdir}/Thread-Conveyor-Monitored-0.14"
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
