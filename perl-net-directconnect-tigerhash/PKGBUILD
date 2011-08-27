# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-net-directconnect-tigerhash'
pkgver='0.06'
pkgrel='1'
pkgdesc="Perl extension for calculating tiger hashes from files or strings"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Net-DirectConnect-TigerHash'
source=('http://search.cpan.org/CPAN/authors/id/P/PR/PRO/Net-DirectConnect-TigerHash-0.06.tar.gz')
md5sums=('f8f4ce26c49afecb451f1b1e9874f6b3')

build() {
  _DISTDIR="${srcdir}/Net-DirectConnect-TigerHash-0.06"
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
