# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-ima-db
pkgver=0.35
pkgrel=1
pkgdesc="Database connection caching and organization"
arch=(any)
url="http://search.cpan.org/dist/Ima-DBI/lib/Ima/DBI.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-dbi' 'perl-class-data-inheritable' 'perl-dbix-contextualfetch')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PERRIN/Ima-DBI-$pkgver.tar.gz)
md5sums=('f3c5c0b1fe509556ca35f08aae91b3f5')

build() {
  cd "$srcdir/Ima-DBI-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
