# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-export-easy
pkgver=0.16
pkgrel=1
pkgdesc="Takes the drudgery out of Exporting symbols"
arch=(any)
url="http://search.cpan.org/~fdaly/Exporter-Easy-$pkgver/lib/Exporter/Easy.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/F/FD/FDALY/Exporter-Easy-$pkgver.tar.gz)
md5sums=('16f44909db2e85578ed2f26db490312b')

build() {
  cd "$srcdir/Exporter-Easy-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
