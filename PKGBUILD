pkgname=perl-plack-middleware-reverseproxy
pkgver=0.11
pkgrel=1
pkgdesc="Plack::Middleware::ReverseProxy - Supports app to run as a reverse proxy backend"
arch=('any')
url="http://search.cpan.org/~danjou/Plack-Middleware-ReverseProxy/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-plack' 'perl-yaml' 'perl-test-base')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DANJOU/Plack-Middleware-ReverseProxy-$pkgver.tar.gz)
md5sums=('99748914ad37508ff8a122903e6da2b6')

build() {
  cd  "$srcdir/Plack-Middleware-ReverseProxy-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}