# Maintainer: George Hilliard <gh403 at msstate dot edu>
_author="Russell Graham"
_perlmod=lingua-en-conjugate
pkgname=perl-$_perlmod
pkgver=0.311
pkgrel=2
pkgdesc="Constructs various verb tenses in English"
arch=(any)
url="http://search.cpan.org/~rwg/Lingua-EN-Conjugate-$pkgver"
license=('PerlArtistic' 'GPL')
groups=()
depends=('perl>=5.10.0' perl-lingua-en-contraction)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/R/RW/RWG/Lingua-EN-Conjugate-$pkgver.tar.gz)
md5sums=('b3e99cbb11d27094b08c04ab29132692')

build() {
  cd "$srcdir/Lingua-EN-Conjugate-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build 
}

package() {
  cd "$srcdir/Lingua-EN-Conjugate-$pkgver"
  perl Build install
}

# vim:set ts=2 sw=2 et:
