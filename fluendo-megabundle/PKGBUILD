# Maintainer: Pyro Devil <p.devil@gmail.com>
pkgname=fluendo-megabundle  
pkgver=19
pkgrel=1
pkgdesc="This package contains every gstreamer-plugin from Fluendo"
url="http://www.fluendo.com/shop/product/complete-set-of-playback-plugins/"
arch=('x86_64' 'i686')
license=('custom')
depends=('gst-plugins-base-libs' 'gstreamer0.10-base' 'libgl')
makedepends=()
conflicts=()
replaces=()
backup=()
install=

if test "$CARCH" == x86_64; then
  source=(oneplay-gstreamer-codecs-pack-$pkgver.x86_64.tar_.bz2)
  md5sums=('bd032a918893609387e864af85654999')
fi

if test "$CARCH" == i686; then
  source=(oneplay-gstreamer-codecs-pack-$pkgver.i386.tar_.bz2)
  md5sums=('fb447b2b6f715677dd391a46decd7655')
fi

package() {
  mkdir -p "$pkgdir/usr/lib"
  cp -r "$srcdir/codecs/gstreamer-0.10" "$pkgdir/usr/lib/" 

  cp -r "$srcdir/codecs/gstreamer-1.0" "$pkgdir/usr/lib/" 
  chmod -R 0755 "$pkgdir/usr/lib/"

  install -Dm664 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
