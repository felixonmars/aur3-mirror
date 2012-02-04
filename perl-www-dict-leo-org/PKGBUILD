# Maintainer: Moritz Heidkamp <moritz@twoticketsplease.de>

pkgname=perl-www-dict-leo-org
pkgver=1.34
pkgrel=2
pkgdesc="Perl/CPAN Module WWW::Dict::Leo::Org : Interface module to dictionary dict.leo.org"
arch=("i686" "x86_64")
url="http://search.cpan.org/~tlinden/WWW-Dict-Leo-Org/"
license=("GPL" "PerlArtistic")
source=("http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/WWW-Dict-Leo-Org-${pkgver}.tar.gz")
md5sums=('ff067fcf65803d3e056a2ed4b15b1844')
depends=('perl-html-tableparser')

build() {
  cd $startdir/src/WWW-Dict-Leo-Org-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}