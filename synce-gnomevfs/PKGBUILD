# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Maciej Samolej <mcoilpol@gmail.com>
pkgname=synce-gnomevfs
pkgver=0.13
pkgrel=2
pkgdesc="SynCE GNOME VFS plugin"
arch=('i686' 'x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-librapi' 'gvfs' 'synce-libsynce')
source=(http://downloads.sourceforge.net/sourceforge/synce/$pkgname-$pkgver.tar.gz)
md5sums=('6069ead295f8d26362a1fab6083b40a8')

package() {
 cd $startdir/src/$pkgname-$pkgver/
  ./configure --prefix=/usr --sysconfdir=/etc
   make
   make DESTDIR="$pkgdir/" install || return 1
}
