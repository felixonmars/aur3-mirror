# Maintainer: mareex <marcus.behrendt.86@gmail.com>

pkgname=pidgin-whatsapp
pkgver=0.5.1
pkgrel=1
pkgdesc="Whatsapp protocol for pidgin"
arch=('any')
url="https://launchpad.net/~whatsapp-purple/+archive/ppa/"
license=('GPL')
depends=('pidgin')
makedepends=('make')
source=("http://ppa.launchpad.net/whatsapp-purple/ppa/ubuntu/pool/main/p/pidgin-whatsapp/${pkgname}_${pkgver}.tar.gz")
sha256sums=('51c3f10684755a84f1cf467417435c73698b20c35c7aa9986b350c23de16fe74')

build() {
   cd $srcdir/whatsapp-purple
   make
}

package() {
  mkdir -p $pkgdir/usr/lib/purple-2/
  mkdir -p $pkgdir/usr/share/doc/pidgin-whatsapp
  mkdir -p $pkgdir/usr/share/pixmaps/pidgin/protocols/16
  mkdir -p $pkgdir/usr/share/pixmaps/pidgin/protocols/22
  mkdir -p $pkgdir/usr/share/pixmaps/pidgin/protocols/48
  install -m0755 $srcdir/whatsapp-purple/libwhatsapp.so "$pkgdir/usr/lib/purple-2/"
  install -m0644 $srcdir/whatsapp-purple/debian/copyright "$pkgdir/usr/share/doc/pidgin-whatsapp"
  install -m0644 $srcdir/whatsapp-purple/debian/changelog "$pkgdir/usr/share/doc/pidgin-whatsapp"
  install -m0644 $srcdir/whatsapp-purple/whatsapp16.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/16/whatsapp.png"
  install -m0644 $srcdir/whatsapp-purple/whatsapp22.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/22/whatsapp.png"
  install -m0644 $srcdir/whatsapp-purple/whatsapp48.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/48/whatsapp.png"
}
