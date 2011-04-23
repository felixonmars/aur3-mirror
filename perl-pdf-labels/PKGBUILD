# Maintainer: sportscliche <mph at sportscliche dot com>
pkgname=perl-pdf-labels
_realname=PDF-Labels
pkgver=1.8
pkgrel=1
pkgdesc="CPAN module to produce formatted pages of mailing labels in PDF"
arch=('any')
url="http://search.cpan.org/~owen/PDF-Labels-1.8/Labels.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-pdf-create')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/O/OW/OWEN/${_realname}-${pkgver}.tar.gz)
md5sums=('045898e035187446a5d643c832d55251')

build() {
  cd "$srcdir/$_realname-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
