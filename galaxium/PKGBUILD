# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=galaxium
pkgver=0.7.4.1
pkgrel=5
pkgdesc="A multi-protocol instant messenger application designed for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://galaxium.googlecode.com/"
license=('GPL')
depends=('mono-addins>=0.3' 'libanculus-sharp>=0.3.1' 'gstreamer0.10' 'webkit-sharp' 'ndesk-dbus-glib' 'bash')
optdepends=('swfdec: MSN winks support')
source=("http://${pkgname}.googlecode.com/files/${pkgname}_${pkgver}.tar.gz" "patch")
md5sums=('052f78549218b2421a861a8ea245f616'
         '529e1f1ffaefb9be9fce9dcaaaa3b940')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 -i $srcdir/patch
  ./autogen.sh --prefix=/usr 
  make 
  }
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
