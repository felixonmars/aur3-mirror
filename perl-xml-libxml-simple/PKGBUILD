# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-xml-libxml-simple
pkgver=0.95
pkgrel=1
pkgdesc="XML::LibXML based XML::Simple clone"
arch=('any')
url="http://perl.overmeer.net/xml-libxml-simple/"
license=('PerlArtistic')
depends=('perl-xml-libxml' 'perl-file-slurp')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/M/MA/MARKOV/XML-LibXML-Simple-$pkgver.tar.gz)

build() {
  cd  $srcdir/XML-LibXML-Simple-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  $srcdir/XML-LibXML-Simple-$pkgver
  make pure_install doc_install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

md5sums=('862fd977c97c4ec777a235522e12229d')
