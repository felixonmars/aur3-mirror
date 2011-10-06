# Maintainer: spider-mario <spidermario@free.fr>
_author=oliviert
_perlmod=WebService-Validator-CSS-W3C
pkgname=perl-webservice-validator-css-w3c
pkgver=0.2
pkgrel=2
pkgdesc="Perl interface to the W3C CSS Validator"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('custom')
groups=()
depends=('perl>=5.10.0'
         'perl-libwww'
         'perl-soap-lite'
         'perl-class-accessor')
options=(!emptydirs !strip)
source=(http://search.cpan.org/CPAN/authors/id/O/OL/OLIVIERT/WebService/$_perlmod-$pkgver.tar.gz
        LICENSE)
md5sums=('bac54611541f72e1cfd12949afae9a1f'
         'a631fc32ae66a1c0543fd537863947df')    

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  install --directory "$pkgdir/usr/share/licenses/$pkgname"
  install "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
