# Maintainer: kevku <kevku@msn.com>
pkgname=perl-moosex-configfromfile
pkgver=0.10
pkgrel=1
pkgdesc="MooseX::ConfigFromFile - An abstract Moose role for setting attributes from a configfile"
arch=('any')
url="http://search.cpan.org/~bobtfish/MooseX-ConfigFromFile"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-moosex-types-path-class' 'perl-namespace-autoclean')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-ConfigFromFile-$pkgver.tar.gz")
md5sums=('9fdd91e4101fbf65b60df43ac6525753')

build() {
  cd "$srcdir/MooseX-ConfigFromFile-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/MooseX-ConfigFromFile-$pkgver"
  make install DESTDIR="$pkgdir/"
}
