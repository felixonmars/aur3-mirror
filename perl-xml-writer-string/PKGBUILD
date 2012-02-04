# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-xml-writer-string
pkgver=0.1
pkgrel=1
pkgdesc="XML::Writer::String - Capture Output of XML::Writer"
arch=('any')
url="http://search.cpan.org/~soliver/XML-Writer-String-0.1/String.pm"
license=('PerlArtistic')
depends=('perl' 'perl-xml-writer')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/S/SO/SOLIVER/XML-Writer-String-${pkgver}.tar.gz")

build() {
  msg "Building XML::Writer::String..."
  cd "${srcdir}/XML-Writer-String-$pkgver"
  DESTDIR="$pkgdir/" PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

check() {
  msg "Checking XML::Writer::String..."
  cd "${srcdir}/XML-Writer-String-$pkgver"
  make test
}

package() {
  msg "Installing XML::Writer::String..."
  cd "${srcdir}/XML-Writer-String-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('528b3ac5ec9d161fd28ff2ddfe65d3b9')
