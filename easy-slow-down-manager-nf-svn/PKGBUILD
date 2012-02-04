# Contributor: Mika Hynnä <mika d hynna at wippies d com>
# Maintainer: Mika Hynnä <mika d hynna at wippies d com>

pkgname=easy-slow-down-manager-nf-svn
pkgver=30
pkgrel=2
pkgdesc="Fan, brightness and WiFi controls for Samsung laptops including NF110/NF210/NF310"
arch=('i686' 'x86_64')
url="http://code.google.com/p/easy-slow-down-manager/"
license=('GPL2')
depends=('kernel26')
makedepends=('kernel26-headers' 'make' 'gcc' 'subversion')
optdepends=('pygtk: for tray software support')
provides=(easy-slow-down-manager)
conflicts=(easy-slow-down-manager easy-slow-down-manager-svn)
source=(nf+python.patch)
md5sums=('e05a9305ca18711bc224760632fdfbf9')

_svntrunk=http://easy-slow-down-manager.googlecode.com/svn/trunk/
_svnmod=easy-slow-down-manager-read-only

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  # PATCH
  patch -p0 < nf+python.patch || return 1

  cd "$srcdir/$_svnmod-build"

  # BUILD

  make -C /lib/modules/`uname -r`/build M=`pwd` modules || return 1

  # INSTALL
  install -D -m 644 samsung-backlight.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/misc/samsung-backlight.ko || return 1
  install -D -m 644 easy_slow_down_manager.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/misc/easy_slow_down_manager.ko || return 1
  install -D -m 644 README $pkgdir/usr/share/doc/easy-slow-down-manager/README || return 1

  install -D -m 755 ui/easy_slow_down_manager.py $pkgdir/usr/bin/easy_slow_down_manager.py || return 1
  install -D -m 755 ui/toggle_backlight.py $pkgdir/usr/bin/toggle_backlight.py || return 1
  install -D -m 755 ui/toggle_wifi.py $pkgdir/usr/bin/toggle_wifi.py || return 1
  install -D -m 755 ui/toggle_fan.py $pkgdir/usr/bin/toggle_fan.py || return 1
}
