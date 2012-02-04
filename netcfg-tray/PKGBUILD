# $Id: PKGBUILD 41631 2009-06-06 02:17:10Z james $
# Maintainer: James Rayner <james@archlinux.org>
pkgname=netcfg-tray
pkgver=3
pkgrel=1
pkgdesc="Tray icon for the netcfg network connection scripts"
url="http://archlinux.org"
license=("BSD")
depends=("netcfg>=2.2.0b3")
optdepends=('gksu: For a GUI password box when running netcfg-tray-helper'
            'python-notify: libnotify based notifications upon events'
            'dzen2: for notifications through dzen2')
source=(http://ftp.archlinux.org/other/netcfg/tray/netcfg-tray-$pkgver.tar.gz)

arch=(any)

build() {
  cd $startdir/src/netcfg-tray-$pkgver
  make DESTDIR=$startdir/pkg install
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/netcfg-tray/LICENSE
}

