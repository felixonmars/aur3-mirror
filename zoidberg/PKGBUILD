# Maintainer: Christian Sturm <reezer@reezer.org>
pkgname=zoidberg
pkgver=0.981
pkgrel=1
pkgdesc="a modular perl shell"
arch=(any)
url="https://metacpan.org/release/Zoidberg"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12.0' 'perl-env-ps1' 'perl-exporter-tidy' 'perl-file-sharedir' 'perl-term-readkey' 'perl-term-readline-zoid')
options=(!emptydirs)
install=
source=(http://cpan.metacpan.org/authors/id/J/JB/JBERGER/Zoidberg-$pkgver.tar.gz)
md5sums=('1d0ee2c5b3664b5da31f2fb87a9aace8')

build() {
  cd "$srcdir/Zoidberg-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
  perl Build install
}

# vim:set ts=2 sw=2 et:
