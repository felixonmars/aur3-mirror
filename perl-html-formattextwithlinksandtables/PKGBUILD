# Maintainer: Diego Nieto Cid <dnietoc@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-html-formattextwithlinksandtables
pkgver=0.01
pkgrel=3
pkgdesc="Format HTML as text"
arch=('any')
url="http://search.cpan.org/dist/HTML-FormatText-WithLinks-AndTables-0.01/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-html-tree>=3.15' 'perl-html-formattextwithlinks')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SF/SFRYER/HTML-FormatText-WithLinks-AndTables-$pkgver.tar.gz
	0001-Fix-inconsistent-formatting.patch
        0002-Add-support-for-th.patch)
md5sums=('0f6132d17056f2b2c20d03f31ea0c533'
         'fc050bb50cbd6adaebdaa91489e74624'
         '2a80cc1854a76c45589c9da6176aeaeb')

build() {
  cd  $startdir/src/HTML-FormatText-WithLinks-AndTables-$pkgver

  patch -p1 -i $srcdir/0001-Fix-inconsistent-formatting.patch
  patch -p0 -i $srcdir/0002-Add-support-for-th.patch

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
