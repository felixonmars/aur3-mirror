# Contributor: Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-notify
pkgver=0.0.5
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A noteo module which replaces notification daemon. Popups can be semi-transparent if a compositing manager is installed"
url="http://sourceforge.net/projects/noteo/"
license=("GPL")
depends=("noteo>=0.0.6" "dbus-python" "pygtk")
provides=("notification-daemon")
conflicts=("notification-daemon")
install=noteo-notify.install
source=("http://downloads.sourceforge.net/noteo/${pkgname}-${pkgver}.tar.gz")
md5sums=('13d42a8a78a364c8101041c0ddc32913')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv Notify $startdir/pkg/usr/share/noteo/
  mkdir -p $startdir/pkg/usr/share/dbus-1/services
  mv org.freedesktop.Notifications.service $startdir/pkg/usr/share/dbus-1/services
}