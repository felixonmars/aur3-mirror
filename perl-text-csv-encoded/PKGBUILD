# CPAN Name  : Text-CSV-Encoded
# Contributor: Liu Yu Fei <hoveringnowings at gmail>
pkgname='perl-text-csv-encoded'
pkgver='0.10'
pkgrel='1'
pkgdesc="Manipulate comma-separated value strings"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Text-CSV-Encoded'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/Text-CSV-Encoded-0.10.tar.gz')
md5sums=('9ed745eb7a416818b9c129eced8af93d')

build(){
  DIST_DIR="${srcdir}/Text-CSV-Encoded-0.10"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
     perl Makefile.PL INSTALLDIRS=vendor &&
     make &&
     make test &&
     make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
