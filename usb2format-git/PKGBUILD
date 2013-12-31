# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=usb2format-git
pkgver=24.702d124
pkgrel=1
pkgdesc="A small graphical utility that can be used to easily format a USB flash drives on Linux"
arch=('any')
url="https://github.com/wifiextender/usb2format"
license=('GPL3')
depends=('python2-gobject' 'python2' 'webkitgtk' 'pywebkitgtk' 'python2-dbus' 'udisks')
makedepends=('git')
source=('git+https://github.com/wifiextender/usb2format.git'
         usb2format.desktop
         usb2format.sh)
md5sums=('SKIP'
         '0e35517000ab3608830553be2bbb73d5'
         'ab4ace9968d246900f5d2e4bb483f6a1')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/share/usb2format
  cp -rf usb2format/* $pkgdir/usr/share/usb2format

  # Start file
  install -Dm755 usb2format.sh $pkgdir/usr/bin/usb2format

  # Desktop icon
  install -Dm644 usb2format.desktop $pkgdir/usr/share/applications/usb2format.desktop
  install -Dm644 usb2format/data_usb2format/usb2format_logo.png $pkgdir/usr/share/pixmaps/usb2format_logo.png
}

pkgver() {
  cd $srcdir/usb2format
  echo $(git rev-list --count master).$(git rev-parse --short master)
}