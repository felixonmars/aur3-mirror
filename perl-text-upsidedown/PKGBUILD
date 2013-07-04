# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=perl-text-upsidedown
pkgver=1.21
pkgrel=1
pkgdesc="Flip text upside-down using Unicode"
arch=(any)
url=http://search.cpan.org/~doherty/Text-UpsideDown/
license=(GPL PerlArtistic)
depends=('perl>=5.10.0')
makedepends=(perl-universal-require)
options=(!emptydirs purge)
source=(http://search.cpan.org/CPAN/authors/id/D/DO/DOHERTY/Text-UpsideDown-$pkgver.tar.gz)
sha256sums=('6fd3cceb8373c9ad4a98ab4ae321f7af1991d68cb4aa195fc3fe832e5cc4c632')
sha512sums=('61322d1c1dbb7d6a2b3aedb7aa169545ccfd782917195183a76abce4e53874b94b08a1c53b1b87964b496771bf74bc391d31076cfa9e16daf7fb7e6049a7432f')

build() {
    cd Text-UpsideDown-$pkgver/
    perl Makefile.PL INSTALLDIRS=vendor PERL_MM_USE_DEFAULT=1
    make
}

package() {
    make -C Text-UpsideDown-$pkgver DESTDIR="$pkgdir" install
}
