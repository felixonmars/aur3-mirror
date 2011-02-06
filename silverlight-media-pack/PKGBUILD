# Maintainer: M0Rf30

pkgname=silverlight-media-pack
pkgver=2
pkgrel=1
pkgdesc="Media pack for Moonlight (useful on Rai website)"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686" ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x64
url="http://download.microsoft.com/"
license=('Proprietary')
install=("silverlight-media-pack.install")
source=("http://download.microsoft.com/download/7/5/5/755FC31E-55C8-4692-BB68-68935CD73F0D/10.22.2009/$pkgname-linux-$ARCH-16-1.so")
md5sums=('48e3c711a2fb6d55282ecbc57e198585')
[ "$CARCH" == "x86_64" ] && md5sums=('23b7d97bce3d311d452d8917a00ea899')

build() {
  install -d -m755 $pkgdir/usr/lib/mozilla/plugins/moonlight
  install -m755 $pkgname-linux-$ARCH-16-1.so $pkgdir/usr/lib/mozilla/plugins/moonlight
}
