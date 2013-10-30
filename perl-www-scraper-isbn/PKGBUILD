# Maintainer: perlawk

pkgname=perl-www-scraper-isbn
pkgver=0.31
pkgrel=9
pkgdesc="Get ISBN data from amazon."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~dougm/Xmms-Perl/"
depends=('perl' 'perl-www-mechanize')
license=('GPL' 'PerlArtistic')
source=( http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/WWW-Scraper-ISBN-Amazon_Driver-0.31.tar.gz
http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/WWW-Scraper-ISBN-Driver-0.20.tar.gz)

_build() {
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

_pack() {
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}

build() {
  cd "$srcdir/"WWW-Scraper-ISBN-Amazon_Driver-0.31
	_build

	cd "$srcdir/"WWW-Scraper-ISBN-Driver-0.20
	_build
}

package() {
  cd "$srcdir/"WWW-Scraper-ISBN-Amazon_Driver-0.31
	_pack

	cd "$srcdir/"WWW-Scraper-ISBN-Driver-0.20
	_pack
}


md5sums=('8b1f1a2deb72a56aa102ef8786e4683a'
         '548e0caa4f65a4046bac11653a8799b8')
