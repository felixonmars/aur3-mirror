# Maintainer: Abby Pan <abbypan@gmail.com>

pkgname=perl-encode-detect-cjk
pkgver=2.0.2
pkgrel=2
pkgdesc="A Charset Detector, optimized for EastAsia charset and website content."
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Encode::Detect::CJK"
license=('GPL' 'PerlArtistic')
source=(
http://cpan.metacpan.org/authors/id/F/FO/FOOLFISH/Encode-Detect-CJK-$pkgver.tar.gz
)
md5sums=('7dacbfa50afb78445c1ae2cb4fd1f4b9')

build() {
  cd  $startdir/src/Encode-Detect-CJK-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}

package(){
  cd  $startdir/src/Encode-Detect-CJK-$pkgver
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
