pkgname=perl-plack-middleware-reverseproxy
pkgver=0.10
pkgrel=2
pkgdesc="Plack::Middleware::ReverseProxy - Supports app to run as a reverse proxy backend"
arch=('any')
url="http://search.cpan.org/~danjou/Plack-Middleware-ReverseProxy-0.10/lib/Plack/Middleware/ReverseProxy.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-plack' 'perl-yaml')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DANJOU/Plack-Middleware-ReverseProxy-0.10.tar.gz)
md5sums=('9473223e9b2415611f3e11b9e02eaa8f')

build() {
  cd  "$srcdir/Plack-Middleware-ReverseProxy-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}