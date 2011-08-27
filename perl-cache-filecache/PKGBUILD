#
# Contributor: Roberto Viola (Cagnulein) <cagnulein@tin.it>
#

pkgname=perl-cache-filecache
pkgver=1.05
pkgrel=1
pkgdesc="The FileCache class implements the Cache interface. This cache stores data in the filesystem so that it can be shared between processes."
url="http://search.cpan.org/~dclinton/Cache-Cache-1.05/lib/Cache/FileCache.pm"
license="GPL"
arch=('i686' 'x86_64')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/D/DC/DCLINTON/Cache-Cache-$pkgver.tar.gz)
md5sums=('09e4d37979c8f8ce2518e1d1ccd10d99')

build() {
  cd $startdir/src/Cache-Cache-$pkgver
  /usr/bin/perl Makefile.PL
  make
  make DESTDIR=$startdir/pkg install

  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm '{}' \;
}
