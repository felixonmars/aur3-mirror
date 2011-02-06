# Maintainer: Giuseppe Borzi <gborzi@ieee.org>
pkgname=disablegss
pkgver=20061026
pkgrel=2
pkgdesc="Disable gnome-screensaver when specific apps are running"
arch=('any')
url="http://ubuntuforums.org/showthread.php?t=284804"
license=('GPL')
depends=('dbus-python' 'gnome-power-manager' 'gnome-screensaver')
source=($pkgname.py example.disablegss README.txt disablegss.desktop)
md5sums=('31d493c206f785a44f6ddf7fe8fbcb20'
         '2167b731dbe778d358790d092bdc8cd3'
         '5709d5660ee6943fa90745c9f945778f'
         'b316da48609909b2c0ef43987c38b29a')

build() {
  install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname.py"
  sed -i -e 's_#! /usr/bin/env python_#! /usr/bin/env python2_' "$pkgdir/usr/bin/$pkgname.py"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/etc/xdg/autostart/$pkgname.desktop"
  install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -m644 "$srcdir/example.$pkgname" "$pkgdir/usr/share/doc/$pkgname/example.$pkgname"
}

# vim:set ts=2 sw=2 et:
