# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-string-interpolate
pkgver=0.3
pkgrel=1
pkgdesc="String::Interpolate - Wrapper for builtin Perl Interpolation engine"
arch=('any')
url="http://search.cpan.org/~nobull/String-Interpolate-0.3/lib/String/Interpolate.pm"
license=('PerlArtistic')
depends=('perl')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/N/NO/NOBULL/String-Interpolate-${pkgver}.tar.gz")

build() {
  msg "Building String::Interpolate..."
  cd "${srcdir}/String-Interpolate-$pkgver"
  DESTDIR="$pkgdir/" PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

check() {
  msg "Checking String::Interpolate..."
  cd "${srcdir}/String-Interpolate-$pkgver"
  make test
}

package() {
  msg "Installing String::Interpolate..."
  cd "${srcdir}/String-Interpolate-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('c3b2c9e5014084c040f24dcf53b8d17e')
