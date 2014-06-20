# Maintainer: Xorxcel <yaourt at web dot de>
_author="thilo"
_perlmod="CGI-Application-Plugin-AutoRunmode"

pkgname=perl-cgi-application-plugin-autorunmode
pkgver=0.18
pkgrel=1
pkgdesc="CGI::App plugin to automatically register runmodes."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pgkver/"
license=('GPL' 'PerlArtistic')
depends=('perl-cgi-application')
source=(http://search.cpan.org/CPAN/authors/id/T/TH/THILO/$_perlmod-$pkgver.tar.gz)
md5sums=('646ecb02dfc627e9748ef29a919f3b89')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  make test || return 1
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  make install DESTDIR="$pkgdir" || return 1

  find "$pkgdir" -name '.packlist' -delete
}

# vim:set ts=2 sw=2 et:
