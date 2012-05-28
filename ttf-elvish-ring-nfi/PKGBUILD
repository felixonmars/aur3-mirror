pkgname=ttf-elvish-ring-nfi
pkgver=1.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
url="http://arvandor.blogspot.com"
pkgdesc="Elvish Ring is a elven font inspired by LotR trilogy."
arch=('any')
license=('freeware')
source=($pkgname-$pkgver.zip::http://dl.dropbox.com/u/7773489/PKG/Fonts/elvish_ring_nfi.zip)
install=$pkgname-$pkgver.install
md5sums=('08092b482e49b7999e764a9296854019')

build()
{
  cd "$srcdir"
  unzip $pkgname-$pkgver
}

package()
{
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

