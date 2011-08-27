# Contributor: Andreas Altergott <altergott@mira-consulting.net>

pkgname=perl-lingua-stem-snowball
pkgver=0.952
pkgrel=1
pkgdesc="Perl interface to Snowball stemmers"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~creamyg/Lingua-Stem-Snowball/"
license=('GPL', 'PerlArtistic', 'BSD')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CR/CREAMYG/Lingua-Stem-Snowball-$pkgver.tar.gz")
md5sums=('6b0085c6fd8ec894e34c593078aa169a')

build() {
  cd $startdir/src/Lingua-Stem-Snowball-$pkgver
  perl Build.PL --destdir $startdir/pkg || return 1
  perl Build || return 1
  perl Build install || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
