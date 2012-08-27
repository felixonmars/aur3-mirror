# CPAN Name  : Plack::Middleware::Deflater
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-plack-middleware-deflater
pkgver=0.08
pkgrel=1
pkgdesc='Perl module providing compression support to Plack'
arch=('any')
url='http://search.cpan.org/dist/Plack-Middleware-Deflater'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.9.4' 'perl-plack')
checkdepends=('perl-test-requires')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Plack-Middleware-Deflater-0.08.tar.gz)
options=(!emptydirs)
md5sums=('44855c8ea51fcc8bd776b2352765d4c2')

build() {
  cd "$srcdir/Plack-Middleware-Deflater-0.08"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Plack-Middleware-Deflater-0.08"
  make test
}

package() {
  cd "$srcdir/Plack-Middleware-Deflater-0.08"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
