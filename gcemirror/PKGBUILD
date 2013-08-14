# Maintainer: Jan Was <janek.jan@gmail.com>

pkgname=gcemirror
pkgver=0.4
pkgrel=1
pkgdesc="Remote control of Windows CE devices in the manner of VNC."
arch=('i686' 'x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-core')
makedepends=('intltool')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/synce/SynCE-GNOME/${pkgname}/${pkgname}-$pkgver.tar.gz)
md5sums=('7589d3a914aa35d922edb0827d9878fa')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
