# Contributor: Nezmer <Nezmer@gmail.com>

pkgname=zekr-quran-translations-nonfree
pkgver=0.7.4
pkgrel=1
pkgdesc="Translation pack for zekr"
url="http://zekr.org"
license=(unknown)
arch=('i686' 'x86_64')
depends=('zekr')
source=(http://ppa.launchpad.net/sabily.team/ubuntu/pool/main/z/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
sha256sums=(88153dae59b2196955c1c336d803cf14c9fccce75db138033f7b936c0a467553)
md5sums=(4ba94e032e2431b7504345bcb3f38123)

build() {
  install -d $pkgdir/usr/share/java/zekr/res/text/trans
  install -D -m755 $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/java/zekr/res/text/trans
  rm $pkgdir/usr/share/java/zekr/res/text/trans/yusufali.trans.zip
}
