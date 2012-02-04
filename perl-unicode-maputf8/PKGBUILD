# Maintainer: Martin Imobersteg <imm@gmx.ch>
pkgname=perl-unicode-maputf8
pkgver=1.11
pkgrel=3
pkgdesc="Perl/CPAN Module Unicode::MapUTF8 : Conversions to and from arbitrary character sets and UTF8."
arch=("i686" "x86_64")
url="http://search.cpan.org/~snowhare/Unicode-MapUTF8-1.11/pod/MapUTF8.en.pod"
license=("GPL")
depends=('perl-unicode-map' 'perl-unicode-map8' 'perl-jcode')
source=("http://search.cpan.org/CPAN/authors/id/S/SN/SNOWHARE/Unicode-MapUTF8-${pkgver}.tar.gz")
md5sums=('16e66ee0bdc0e6cc9c36e29212d8ffdc')
build() {
  cd $startdir/src/Unicode-MapUTF8-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make pure_install doc_install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}

