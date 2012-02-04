# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-thread-pool'
pkgver='0.33'
pkgrel='1'
pkgdesc="Worker pools to run Perl code asynchronously"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-thread-conveyor>=0.15' 'perl-thread-conveyor-monitored>=0.11')
url='http://search.cpan.org/dist/Thread-Pool'
source=('http://search.cpan.org/CPAN/authors/id/E/EL/ELIZABETH/Thread-Pool-0.33.tar.gz')
md5sums=('4e1b093179552283260ab4722b468248')

build() {
  _DISTDIR="${srcdir}/Thread-Pool-0.33"
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
