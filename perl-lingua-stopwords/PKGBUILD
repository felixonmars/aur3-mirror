# Contributor: Andreas Altergott <altergott@mira-consulting.net>

pkgname=perl-lingua-stopwords
pkgver=0.09
pkgrel=1
pkgdesc="Stop words for several languages"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~creamyg/Lingua-StopWords/"
license=('GPL', 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CR/CREAMYG/Lingua-StopWords-$pkgver.tar.gz")
md5sums=('47decfa5a040292ad7f5a5b9088baf0c')

build() {
  cd $startdir/src/Lingua-StopWords-$pkgver
  perl Makefile.PL || return 1
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
