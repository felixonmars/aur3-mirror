# Maintainer: Tony Sokhon <tonyskn@gmail.com>

pkgname=perl-lingua-en-sentence
pkgver=0.25
pkgrel=2
pkgdesc="Perl module for splitting text into sentences"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~shlomoy/Lingua-EN-Sentence/"
license=('Unknown')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMOY/Lingua-EN-Sentence-$pkgver.tar.gz")
md5sums=('4a846acfcb6eedd1c1557fc7f79f034d')

build() {
  cd $startdir/src/Lingua-EN-Sentence-$pkgver
  perl Makefile.PL DESTDIR=$startdir/pkg INSTALLDIRS=vendor
  make || return 1
  make test || return 1
  make install || return 1
}
