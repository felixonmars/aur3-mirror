# Contributor: Charoite Lee <charoitehllee@live.com>
pkgname=perl-http-daemon-ssl
pkgver=1.04
pkgrel=1
pkgdesc='a simple http server class with SSL support'
arch=('any')
url='http://search.cpan.org/dist/HTTP-Daemon-SSL'
license=('GPL' 'PerlArtistic')
depends=('perl-http-daemon>=1.0' 'perl-io-socket-ssl>=0.93')
makedepends=()
provides=('perl-http-daemon-ssl')
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUFFLICK/HTTP-Daemon-SSL-1.04.tar.gz")
changelog=

build() {
  cd "$srcdir/HTTP-Daemon-SSL-1.04"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test &&
    make install; } || return 1
}
md5sums=('fb9463de861bba7864d79045d1e8cded')
