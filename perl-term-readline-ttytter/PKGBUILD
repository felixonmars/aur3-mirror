# Maintainer: Giorgio Lando <patroclo7 at gmail dot com>
pkgname=perl-term-readline-ttytter
pkgver=1.4
pkgrel=1
pkgdesc="a perl readLine for the ttytter twitter client"
arch=(any)
url="http://search.cpan.org/dist/Term-ReadLine-TTYtter"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12.0' 'perl-term-readkey')
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/C/CK/CKAISER/Term-ReadLine-TTYtter-1.4.tar.gz)
md5sums=('3584d8b263ebb08e1b0c434082a2afc3')

build() {
  cd "$srcdir/Term-ReadLine-TTYtter-$pkgver"
  perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
  make 
}

package() {
  cd "$srcdir/Term-ReadLine-TTYtter-$pkgver"
  make install
}
