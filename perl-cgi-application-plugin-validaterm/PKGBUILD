# Maintainer: Xorxcel <yaourt at web dot de>
_author="fany"
_perlmod="CGI-Application-Plugin-ValidateRM"

pkgname=perl-cgi-application-plugin-validaterm
pkgver=2.5
pkgrel=1
pkgdesc="Help validate CGI::Application run modes using Data::FormValidator"
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pgkver/"
license=('GPL' 'PerlArtistic')
depends=('perl-cgi-application' 'perl-html-fillinform' 'perl-data-formvalidator')
source=(http://search.cpan.org/CPAN/authors/id/F/FA/FANY/$_perlmod-$pkgver.tar.gz)
md5sums=('529ed1a5ae534fb5429eb0cde041b0ae')

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
