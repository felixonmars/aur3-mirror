pkgname=perl-tap3-tap3edit
pkgver=0.31
pkgrel=1
pkgdesc="Module to decode, modify and encode Roaming GSM TAP/RAP files"
arch=("any")
url="http://www.tap3edit.com/"
license=('perl')
depends=('perl-convert-asn1')

source=("http://www.tap3edit.com/download/TAP3-Tap3edit-${pkgver}.tar.gz")
md5sums=('00c074d3b8eddb171953d367b251d998')

build() {
  cd $srcdir/TAP3-Tap3edit-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  #make test
  make install DESTDIR=$pkgdir
  #find $pkgdir -name '.packlist' -delete # deleted by makepkg
  #find $pkgdir -name '*.pod' -delete # deleted by makepkg
}

