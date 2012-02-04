# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=linnet
pkgver=0.02
pkgrel=3
pkgdesc="Rational network visualization (hiveplots). Farewell to hairballs."
arch=(any)
url="http://mkweb.bcgsc.ca/linnet/"
license=('unknown')
depends=('perl' 'perl-carp-clan' 'perl-config-general' 'perl-gd' 'perl-graph' 'perl-graphviz' 'perl-list-moreutils' 'perl-math-bezier' 'perl-math-random' 'perl-math-round' 'perl-readonly' 'perl-set-intspan' 'perl-statistics-descriptive' 'perl-storable' 'perl-time-hires' 'perl-math-vecstat')
install=linnet.install
source=(http://mkweb.bcgsc.ca/linnet/distro/$pkgname-$pkgver.tgz)

build() {
  cd $srcdir/$pkgname-$pkgver
  # I may need to fix other paths too.
  sed -ie 's/\#\!\/bin\/env perl/\#\!\/usr\/bin\/env\ perl/g' $(grep -rl 'bin/env perl' *)
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/opt/linnet
  cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/opt/linnet
}

# vim:set ts=2 sw=2 et:
md5sums=('6a0a0aeefa9bea93890ef84bff6f95e5')
