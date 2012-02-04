# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=font-arhangai
pkgver=20030401
pkgrel=3
pkgdesc="Font with Mongolian Cyrillic letters"
url="http://badaa.mngl.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-arhangai')
replaces=('ttf-arhangai')
install=font.install
source=(http://ftp.de.debian.org/debian/pool/main/f/font-arhangai/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('bb23ec8321e224be431e4b95876da978')

build() {
  cd $srcdir/${pkgname}-$pkgver.orig/
  install -Dm644 arhangai.ttf $pkgdir/usr/share/fonts/TTF/arhangai.ttf
  install -d $pkgdir/usr/share/fonts/Type1
  install -m644 arhangai.pf{a,b,m} $pkgdir/usr/share/fonts/Type1/
  install -m644 arhangai.afm $pkgdir/usr/share/fonts/Type1/
  install -m644 arhangai.inf $pkgdir/usr/share/fonts/Type1/
}
