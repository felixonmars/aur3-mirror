# Maintainer: Guido <qqqqqqqqq9 at web dot de>
# Contributor: Mika Hynnä <mika d hynna at wippies d com>
# Contributor: Troy Ankersen <cask d drinker at live d com>
pkgname=easy-slow-down-manager-svn
pkgver=35
pkgrel=4
pkgdesc="Fan, brightness and WiFi controls for Samsung laptops"
arch=('i686' 'x86_64')
url="http://code.google.com/p/easy-slow-down-manager/"
license=('GPL2')
depends=('linux')
makedepends=('linux-headers' 'make' 'gcc' 'subversion')
optdepends=('pygtk: for tray software support' 'python2: for the tools' )
provides=(easy-slow-down-manager)
conflicts=(easy-slow-down-manager)
install=easy-slow-down-manager-svn.install

source=("$pkgname::svn+http://easy-slow-down-manager.googlecode.com/svn/trunk/")
md5sums=("SKIP")

build() {
for i in /usr/lib/modules/*/build 
do
  _kernel=`echo $i | cut -d/ -f 5`
  rm -rf "$srcdir/$pkgname-${_kernel}-build"
  cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-${_kernel}-build"  
  cd "$srcdir/$pkgname-${_kernel}-build"
  for i in ui/* ; do sed -i -e "1,1s@.*@#\!/usr/bin/env python2@" $i; done
  make -C "/usr/lib/modules/$_kernel/build" M=`pwd` modules     
done
}
package() {
for i in /usr/lib/modules/*/build 
do
  _kernel=`echo $i | cut -d/ -f 5`
  _extramodules="$(readlink -f /usr/lib/modules/$_kernel/extramodules)"
  cd "$srcdir/$pkgname-${_kernel}-build"
  install -D -m 644 samsung-backlight.ko "$pkgdir/$_extramodules/samsung-backlight.ko" || return 1
  install -D -m 644 easy_slow_down_manager.ko "$pkgdir/$_extramodules/easy_slow_down_manager.ko" || return 1
done
  install -D -m 644 README $pkgdir/usr/share/doc/easy-slow-down-manager/README || return 1
  install -D -m 755 ui/easy_slow_down_manager.py $pkgdir/usr/bin/easy_slow_down_manager || return 1
  install -D -m 755 ui/toggle_backlight.py $pkgdir/usr/bin/toggle_backlight || return 1
  install -D -m 755 ui/toggle_wifi.py $pkgdir/usr/bin/toggle_wifi || return 1
  install -D -m 755 ui/toggle_fan.py $pkgdir/usr/bin/toggle_fan || return 1
}
