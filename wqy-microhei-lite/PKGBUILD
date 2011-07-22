# Maintaine: zlowly <zlowly@gmail.com>
pkgname=wqy-microhei-lite
pkgver=0.2.0_beta
pkgrel=5
pkgdesc="The "Light" face of WenQuanYi Micro Hei font family."
arch=('any')
license=('GPL3' 'APACHE' 'custom:"font embedding exception"')
install=${pkgname}.install
url="http://wenq.org"
depends=('fontconfig' 'xorg-font-utils')
source=(https://sourceforge.net/projects/wqy/files/$pkgname/${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz)
md5sums=('5b20c27e21ae4a838d3cbfe90ce1030f')
build() {
  cd $srcdir/$pkgname
  tail README.txt --lines=16|head --lines=-3>| FONTEXCEPTION
  mkdir -p $pkgdir/usr/share/fonts/wenquanyi/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m644 *.ttc $pkgdir/usr/share/fonts/wenquanyi/$pkgname/ || return 1
  install -m644 -D FONTEXCEPTION $pkgdir/usr/share/licenses/$pkgname/FONTEXCEPTION || return 1
}
