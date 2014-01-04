# CPAN Name  : Term-ExtendedColor-TTY
# Contributor: Gabriel Fornaeus <gf@hax0r.se>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname='perl-term-extendedcolor-tty'
pkgver="0.028"
pkgrel='1'
pkgdesc="Subclass to Term::ExtendedColor"
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Term-ExtendedColor-TTY'
license=('PerlArtistic' 'GPL')
#depends=('perl-term-readkey')
options=('!emptydirs')

source='http://search.cpan.org/CPAN/authors/id/W/WO/WOLDRICH/Term-ExtendedColor-TTY-0.028.tar.gz'
md5sums=('0c6a3432cb7bb0a419ee7dc7c9137c49')

build() {
  cd "$srcdir/Term-ExtendedColor-TTY-$pkgver"
  MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

check() {
  cd "$srcdir/Term-ExtendedColor-TTY-$pkgver"
  make test
}

package() {
  cd "$srcdir/Term-ExtendedColor-TTY-$pkgver"
  make DESTDIR="$pkgdir" install
}



