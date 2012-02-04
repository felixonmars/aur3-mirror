# Maintainer: Christian Sturm <reezer@reezer.org>
pkgname=perl-file-sharedir-par
pkgver=0.06
pkgrel=1
pkgdesc="File::ShareDir with PAR support"
arch=(any)
url="http://metacpan.org/module/File::ShareDir::PAR"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' perl-par perl-file-sharedir)
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/File-ShareDir-PAR-$pkgver.tar.gz)
md5sums=(b20918970fcb4e88c7708fcb451b1116)

build() {
  cd "$srcdir/File-ShareDir-PAR-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/File-ShareDir-PAR-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
