# Maintainer: Christian Sturm <reezer@reezer.org>
pkgname=perl-opengl-list
pkgver=0.01
pkgrel=1
pkgdesc="Massively optimise your Perl OpenGL program with display lists "
arch=(any)
url="http://beta.metacpan.org/module/OpenGL::List"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12.0' perl-opengl)
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/OpenGL-List-$pkgver.tar.gz)
md5sums=('8b304f424f41de9e6ea2dd0813bfbd59')

build() {
  cd "$srcdir/OpenGL-List-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1
}

# vim:set ts=2 sw=2 et:
