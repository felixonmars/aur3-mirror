# Contributor: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=perl-iterator-util
pkgver=0.02
pkgrel=2
pkgdesc="Iterator::Util - Essential utilities for the Iterator class."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~roode/Iterator-Util/"
license=('PerlArtistic')
depends=('perl>=5.004' 'perl-iterator')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RO/ROODE/Iterator-Util-$pkgver.tar.gz)
md5sums=('2b5f0c779c578e00e4d66613c051211f')

build() {
  cd "$srcdir/Iterator-Util-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

