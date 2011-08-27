# Contributor: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=perl-class-dbi-frozen-301
pkgver=3.0.1
pkgrel=1
pkgdesc="Simple Database Abstraction"
arch=(any)
url="http://search.cpan.org/dist/Class-DBI-Frozen-301/lib/Class/DBI/Frozen/301.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
conflicts=('perl-class-dbi')
provides=('perl-class-dbi')
source=(http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Class-DBI-Frozen-301-$pkgver.tar.gz)
md5sums=('834971643ffee38632b6702e92bef692')

build() {
  cd "$srcdir/Class-DBI-Frozen-301-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
