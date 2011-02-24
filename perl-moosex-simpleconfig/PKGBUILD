# Maintainer: kevku <kevku@msn.com>
pkgname=perl-moosex-simpleconfig
pkgver=0.09
pkgrel=1
pkgdesc="MooseX::SimpleConfig - A Moose role for setting attributes from a simple configfile  "
arch=('any')
url="http://search.cpan.org/~bobtfish/MooseX-SimpleConfig"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-moosex-configfromfile' 'perl-config-any')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/MooseX-SimpleConfig-$pkgver.tar.gz")
md5sums=('49c05fc0a8416c7def16f4b664a366e7')

build() {
  cd "$srcdir/MooseX-SimpleConfig-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/MooseX-SimpleConfig-$pkgver"
  make install DESTDIR="$pkgdir/"
}