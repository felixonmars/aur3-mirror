# Maintainer: Glorf <michal99999@gmail.com>

pkgname=perl-apache-gallery
_pkgname=Apache-Gallery
pkgver=1.0.2
pkgrel=2
pkgdesc="mod_perl handler to create an image gallery "
arch=('any')
url="http://apachegallery.dk/"
license=('GPL')
depends=('mod_perl' 'perl-http-date' 'perl-image-info' 'perl-image-size' 'perl-image-imlib2' 'perl-text-template' 'perl-uri' 'perl-cgi' 'perl-test-simple' 'perl-pathtools' 'perl')
source=("http://apachegallery.dk/download/Apache-Gallery-$pkgver.tar.gz" "Apache-Gallery.patch")
md5sums=('97d2a78cc8563ab59277a9aeb392ae7b'
         'a84c58c9b1411ccf53342e65a5f20ee4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  #Patch required to fix mod_perl.pm naming bugs
  patch lib/Apache/Gallery.pm < $startdir/Apache-Gallery.patch
  perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
