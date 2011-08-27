# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Max Nemeth <max.nemeth@gmail.com>

pkgname=perl-threads-shared
pkgver=1.36
pkgrel=1
pkgdesc="A Perl extension for sharing data structures between threads"
arch=('any')
url="http://search.cpan.org/dist/threads-shared/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8.0')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JD/JDHEDDEN/threads-shared-$pkgver.tar.gz)
md5sums=('9e4ce810443e2cf44ecc0a555f715487')

build() {
  cd "$srcdir/threads-shared-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir/threads-shared-$pkgver"
  make DESTDIR="$pkgdir" install
}
