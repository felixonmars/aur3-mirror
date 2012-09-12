# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-margouilla
pkgver=0.9.0
pkgrel=1
pkgdesc="The margouilla library and headers for OpenSAND"
arch=('i686')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('gcc-libs')
options=('!libtool')
source=("https://launchpad.net/opensand/0.9.x/0.9.0/+download/opensand-${pkgver}.tar.gz"
        "https://launchpadlibrarian.net/113728335/fix_bug1042273.patch"
        "fix_bug_1044070.patch")
md5sums=('16ccb9ce24259f7ca943f05b5b322bc1'
         '8e762b48e374cd784c5662e18146dce5'
         '4b858c8fc8ca34682138f85fe3d16e11')

build() {
  cd "$srcdir/opensand-$pkgver"
  tar xf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  patch -p1 < $srcdir/fix_bug_1044070.patch
  patch -p1 < $srcdir/fix_bug1042273.patch
  aclocal
  libtoolize --force
  autoconf
  autoheader
  automake
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
