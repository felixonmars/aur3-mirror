# Contributor: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=perl-iterator
pkgver=0.03
pkgrel=2
pkgdesc="Iterator - A general-purpose iterator class."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~roode/Iterator/"
license=('PerlArtistic')
depends=('perl>=5.004' 'perl-exception-class>=1.21')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RO/ROODE/Iterator-$pkgver.tar.gz)
md5sums=('d59487c209c00a26e203c489dbe69b07')

build() {
  cd "$srcdir/Iterator-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

