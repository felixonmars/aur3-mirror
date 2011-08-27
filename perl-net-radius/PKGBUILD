# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-net-radius'
pkgver='2.103'
pkgrel='1'
pkgdesc="~"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-test-warn')
url='http://search.cpan.org/dist/Net-Radius'
source=('http://search.cpan.org/CPAN/authors/id/L/LU/LUISMUNOZ/Net-Radius-2.103.tar.gz')
md5sums=('e2accc1652b792d08e383dd1d93bb596')

build() {
  _DISTDIR="${srcdir}/Net-Radius-2.103"
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
