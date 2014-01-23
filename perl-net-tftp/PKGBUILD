# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='perl-net-tftp'
pkgver='0.19'
pkgrel='2'
pkgdesc="Net::TFTP - TFTP Client class for perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="http://search.cpan.org/~gbarr/Net-TFTP-${pkgver}/TFTP.pm"
source=("http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Net-TFTP-${pkgver}.tar.gz")
sha512sums=("b77b1622879b7c7f94e156ea4d89adf81282fdbf772226d450c9f98a551e8f705b72e9c43d45040bc377c590e74aeeeaf0271d8350007d454a535e1af6c945cd")

build() {
    cd "$srcdir/Net-TFTP-${pkgver}"
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "$srcdir/Net-TFTP-${pkgver}"
    make DESTDIR=$pkgdir install
}
