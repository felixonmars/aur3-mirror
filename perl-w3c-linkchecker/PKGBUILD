# Maintainer: spider-mario <spidermario@free.fr>
_author=scop
_perlmod=W3C-LinkChecker
pkgname=perl-w3c-linkchecker
pkgver=4.81
pkgrel=2
pkgdesc="Perl module to check the validity of links in an HTML or XHTML document"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod/"
license=('custom:W3C')
depends=('perl>=5.10.0'
         'perl-libwww'
         'perl-css-dom'
         'perl-html-parser'
         'perl-time-hires'
         'perl-encode')
options=(!emptydirs !strip)
source=(http://search.cpan.org/CPAN/authors/id/S/SC/SCOP/$_perlmod-$pkgver.tar.gz
        LICENSE)
md5sums=('9d0e2e3ee3a274c28452cb1d70bd4ad5'
         '1764fd3003c917e7868f47f5f24be8fd')

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
