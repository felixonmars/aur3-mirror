# Maintainer: milki <milki@rescomp.berkeley.edu>

_author='PEVANS'
_perlmod='Alien-libtermkey'
pkgname=perl-alien-libtermkey
pkgver=0.16
pkgrel=1
pkgdesc="Alien wrapping for libtermkey"
arch=('x86_64 i386')
url="https://metacpan.org/module/Alien::libtermkey"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs !libtool')
source=('http://cpan.metacpan.org/authors/id/P/PE/PEVANS/Alien-libtermkey-0.16.tar.gz')
sha256sums=('1d08a7070a6c0833c07b5518d5fda622eda15d9a3e2c490867dba03a0fb9de5d')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
}
