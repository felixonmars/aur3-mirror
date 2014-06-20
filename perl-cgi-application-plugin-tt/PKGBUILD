# Maintainer: Xorxcel <yaourt at web dot de>
_author="ceeshek"
_perlmod="CGI-Application-Plugin-TT"

pkgname=perl-cgi-application-plugin-tt
pkgver=1.05
pkgrel=1
pkgdesc="Add Template Toolkit support to CGI::Application"
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pgkver/"
license=('GPL' 'PerlArtistic')
depends=('perl-cgi-application' 'perl-template-toolkit')
source=(http://search.cpan.org/CPAN/authors/id/C/CE/CEESHEK/$_perlmod-$pkgver.tar.gz)
md5sums=('6e795c093a011cb701ab877deb0917a4')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL --installdirs=vendor --destdir="$pkgdir"
  perl Build
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build install

  find "$pkgdir" -name '.packlist' -delete
}

# vim:set ts=2 sw=2 et:
