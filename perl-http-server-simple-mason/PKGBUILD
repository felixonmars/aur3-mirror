# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>
_perlmod=HTTP-Server-Simple-Mason
pkgname=perl-http-server-simple-mason
pkgver=0.14
pkgrel=1
pkgdesc='An abstract baseclass for a standalone mason server'
arch=('any')
url='http://search.cpan.org/dist/HTTP-Server-Simple-Mason/'
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-http-server-simple' 'perl-html-mason' 'perl-hook-lexwrap')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/$_perlmod-$pkgver.tar.gz")
md5sums=('6bbceccb5e4f276b7b56b8b993bf252b')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test; } || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}
