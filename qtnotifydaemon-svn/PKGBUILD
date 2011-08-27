pkgname=qtnotifydaemon-svn
pkgver=40
pkgrel=1
pkgdesc="Configurable and flexible Qt notification daemon"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qtnotifydaemon"
license=('GPL3')
depends=('qt')
makedepends=('subversion')
source=('org.freedesktop.Notifications.service')
md5sums=('3ddb9114a6de013592449a88a12aef46')
install="${pkgname}.install"
provides=('qtnotifydaemon' 'notification-daemon' 'xfce4-notifyd' 'notify-osd')
conflicts=('qtnotifydaemon' 'notification-daemon' 'xfce4-notifyd' 'notify-osd')

_svntrunk="https://qtnotifydaemon.svn.sourceforge.net/svnroot/qtnotifydaemon"
_svnmod="qtnotifydaemon"

build()  {
  cd ${srcdir}

  msg2 "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg2 "SVN checkout done or server timeout"

  msg2 "Starting make..."
  if [[ -d "${srcdir}/build" ]]; then
    msg2 "Cleaning the previous build directory..."
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"
  qmake ${srcdir}/${_svnmod}/qtnotifydaemon.pro
  make
}

package() {
  install -Dm 755 ${srcdir}/${_svnmod}-build/qtnotifydaemon ${pkgdir}/usr/bin/qtnotifydaemon
  install -Dm 644 ${srcdir}/org.freedesktop.Notifications.service ${pkgdir}/usr/share/dbus-1/services/org.freedesktop.Notifications.service
}