# Contributor: Pizon <pizon@pizon.org>

pkgname=perl-gdgraph-3d
pkgver=0.63
pkgrel=1
pkgdesc="Create 3D Graphs with GD and GD::Graph"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~wadg/GD-Graph3d"
license=('GPL' 'PerlArtistic')
depends=('perl-gd>=1.18' 'perl-gdtextutil>=0.80')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/W/WA/WADG/GD-Graph3d-$pkgver.tar.gz) 
md5sums=('f866dcdd1e7e2056bb946ab7ac3fe37b')

build() {
  cd  $startdir/src/GD-Graph3d-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
