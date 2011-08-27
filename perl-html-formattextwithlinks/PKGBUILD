# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-html-formattextwithlinks
pkgver=0.14
pkgrel=1
pkgdesc="HTML to text conversion with links as footnotes."
arch=('any')
url="http://search.cpan.org/dist/HTML-FormatText-WithLinks-0.14/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-html-tree' 'perl-html-format')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/ST/STRUAN/HTML-FormatText-WithLinks-$pkgver.tar.gz)
md5sums=('264a1436883d20b81e669c65a1f97367')

build() {
  cd  $startdir/src/HTML-FormatText-WithLinks-$pkgver

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
