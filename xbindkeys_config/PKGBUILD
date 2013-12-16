#Maintainer: hellwoofa (at arcor dot de)
#PKGBUILD found at http://tur.berlios.de/pkgbuild/whatah/xbindkeys_config/PKGBUILD thx!
pkgname=xbindkeys_config
pkgver=0.1.3
pkgrel=3
pkgdesc="XBindKeys_Config is an easy to use gtk program for configuring Xbindkeys."
arch=(i686 x86_64)
url="http://hocwp.free.fr/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('xbindkeys' 'gtk')
conflicts=('xbindkeys_config-gtk2')
source=(http://home.arcor.de/hellwoofa/$pkgname-$pkgver.tar.gz)
md5sums=('c8983fd822e66c9f9bfbe5e99044a203')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
 }

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir" install
}
