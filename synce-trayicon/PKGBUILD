# Contributor: Jon Sturm <jasturm002@aol.com>
# Contributor: Maciej Samolej <mcoilpol@gmail.com>

pkgname=synce-trayicon
pkgver=0.17
pkgrel=1
pkgdesc="SynCE trayicon for GNOME and other GTK+ environments"
arch=('i686' 'x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-gvfs' 'orange' 'dynamite' 'synce-sync-engine')
#optdepends=('synce-hal: the best method to actually connect to the device')
source=(http://sourceforge.net/projects/synce/files/SynCE-GNOME/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0ebb11add5cf858f6334a97e3647e1e3')


build() {
  cd $srcdir/$pkgname-$pkgver/

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/

  make DESTDIR="${pkgdir}" install
}
