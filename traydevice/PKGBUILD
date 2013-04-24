# Contributor: shpelda at gmail dot com 

pkgname=traydevice
pkgver=1.6.2
pkgrel=1
pkgdesc="Lightweight, highly configurable single device systray representation"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/traydevice"
depends=('python2-dbus' 'pygtk' 'python2-lxml' 'pyxdg' 'udisks')
makedepends=('docbook2x')
license=('GPL')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6cdae462a24cabe1fc8fd807da6d964c')


package() {
  cd $srcdir/$pkgname-$pkgver
   python2 setup.py install \
         --root=$pkgdir\
         --prefix=/usr\
         --install-data=/usr/share/traydevice\
         --install-man=/usr/share/man
}

