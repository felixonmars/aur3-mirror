pkgname=perl-encode-escape
_PkgName=Encode-Escape
pkgver=0.14
pkgrel=1
pkgdesc="Encode::Escape - Perl extension for Encodings of various escape sequences"
arch=("any")
url="http://search.cpan.org/~you/Encode-Escape-0.14/"
license=('custom')

source=("http://search.cpan.org/CPAN/authors/id/Y/YO/YOU/$_PkgName-$pkgver.tar.gz"
        "fix-unwanted-newlines.patch")
md5sums=('9edd98f8abf1a21a4fe5009a2c1018a5'
         'b478e4bf5c26656221813d1959099ff6')

build() {
  cd $srcdir/$_PkgName-0.14
  patch -Np1 -i ../fix-unwanted-newlines.patch
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL # INSTALLDIRS=vendor
  make
  #make test
  make install DESTDIR=$pkgdir
}
