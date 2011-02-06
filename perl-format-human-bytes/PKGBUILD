# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-format-human-bytes
pkgver=0.06
pkgrel=1
pkgdesc="Format a bytecount and make it human readable "
arch=(any)
url="http://search.cpan.org/dist/Format-Human-Bytes/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/S/SE/SEWI/Format-Human-Bytes-$pkgver.tar.gz)
md5sums=('709e90c62599def49071735e842632c8')

build() {
  cd "$srcdir/Format-Human-Bytes-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
