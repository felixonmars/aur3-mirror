# Contributor: Andreas Altergott <altergott@mira-consulting.net>

pkgname=perl-kinosearch
pkgver=0.164
pkgrel=2
pkgdesc="search engine library"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~creamyg/KinoSearch/"
license=('GPL', 'PerlArtistic')
depends=('perl' 'perl-lingua-stem-snowball' 'perl-lingua-stopwords')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CR/CREAMYG/KinoSearch-$pkgver.tar.gz")
md5sums=('9fd011170455974544af83005f0cb350')

build() {
  cd $startdir/src/KinoSearch-$pkgver
  perl Build.PL --destdir $startdir/pkg || return 1
  perl Build || return 1
  perl Build install || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
