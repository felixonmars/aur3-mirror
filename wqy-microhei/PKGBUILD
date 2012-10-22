# Maintainer: Philacorns <opuspace@gmail.com>

pkgname=wqy-microhei
pkgver=0.2.0_beta
pkgrel=4
pkgdesc="A Sans-Serif style high quality CJK outline font."
arch=('any')
license=('GPL3' 'APACHE' 'custom:"font embedding exception"')
install=wqy-microhei.install
url="http://wenq.org"
depends=('fontconfig' 'xorg-font-utils')
source=(http://downloads.sourceforge.net/project/wqy/$pkgname/${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz
'44-wqy-microhei.conf')
md5sums=('a124c5c6606f4f3b733d3477380e9d2f'
         '2614129902fda4e45aa7f0f7b635cc4f')
build() {
  cd $srcdir/$pkgname
  tail README.txt --lines=16|head --lines=-3>| FONTEXCEPTION
}

package() {
  install -d $pkgdir/usr/share/fonts/wenquanyi/$pkgname/
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -d $pkgdir/etc/fonts/conf.avail/
  install -d $pkgdir/etc/fonts/conf.d/
  install -m644 $srcdir/*.conf $pkgdir/etc/fonts/conf.avail/ || return 1
  install -m644 $srcdir/$pkgname/*.ttc $pkgdir/usr/share/fonts/wenquanyi/$pkgname/ || return 1
  install -m644 -D $srcdir/$pkgname/FONTEXCEPTION $pkgdir/usr/share/licenses/$pkgname/FONTEXCEPTION || return 1
  cd $pkgdir/etc/fonts/conf.d/
  ln -s ../conf.avail/44-wqy-microhei.conf .
}
