# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-lib-abs'
pkgver='0.92'
pkgrel='1'
pkgdesc="C<lib> that makes relative path absolute to caller."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
url='http://search.cpan.org/dist/lib-abs'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MONS/lib-abs-0.92.tar.gz')
md5sums=('d64cdde79c795f5980fc52588fdf56ce')

build() {
  _DISTDIR="${srcdir}/lib-abs-0.92"
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
