# Maintainer: Lars Jacob <lars+aur at jaclar dot net>
pkgname=magick-rotation
pkgver=1.6.1
pkgrel=1
pkgdesc="An autorate helper for tablet pc's like Lenovo, HP, Dell tablets"
arch=('i686' 'x86_64')
if test "$CARCH" == x86_64; then
  bit=64
else
  bit=32
fi
url=https://launchpad.net/magick-rotation/
license=('GPL2')
install="$pkgname.install"
depends=('xorg-xrandr' 'udev' 'xdg-utils' 'pygtk')
source=("https://launchpad.net/$pkgname/trunk/1.6/+download/$pkgname-$pkgver.tar.bz2" "$pkgname.install" "$pkgname.desktop")
md5sums=('4bde516240f694018f29c56bd1557641'
         '5fa155a388c5f09a2e1ce00b83fe3f06'
         '76cae3a82c187f3ef43caac67bd06524')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  gcc check.c -o "checkmagick$bit" -lX11 -lXrandr
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  install -d "$pkgdir/etc/xdg/autostart"
  install -m 644 "$pkgname.desktop" "$pkgdir/etc/xdg/autostart/"

  cd "$srcdir/$pkgname-$pkgver"

  # binaries
  install -d "$pkgdir/usr/bin"
  install -m 755 "checkmagick$bit" "$pkgdir/usr/bin/"

  # udev rules
  install -d "$pkgdir/etc/udev/rules.d"
  install -m 644  62-magick.rules "$pkgdir/etc/udev/rules.d/"

  # Python Files
  install -d "$pkgdir/usr/share/$pkgname"
  install -m 644 ChangeLog "$pkgdir/usr/share/$pkgname/"
  install -m 755 config.py "$pkgdir/usr/share/$pkgname/"
  install -m 755 debug.py "$pkgdir/usr/share/$pkgname/"
  install -m 755 gui_gtk.py "$pkgdir/usr/share/$pkgname/"
  install -m 755 hinge.py "$pkgdir/usr/share/$pkgname/"
  install -m 755 listener.py "$pkgdir/usr/share/$pkgname/"
  install -m 755 magick-rotation "$pkgdir/usr/share/$pkgname/"
#  install -m 755 oem_wmi.py "$pkgdir/usr/share/$pkgname/"
  install -m 755 xrotate.py "$pkgdir/usr/share/$pkgname/"

  # Icons
  cd MagickIcons
  install -d "$pkgdir/usr/share/$pkgname/MagickIcons"
  install -m 644 MagickAbout.png "$pkgdir/usr/share/$pkgname/MagickIcons/"
  install -m 644 magick-rotation-disabled.png "$pkgdir/usr/share/$pkgname/MagickIcons/"
  install -m 644 magick-rotation-disabled-touchoff.png "$pkgdir/usr/share/$pkgname/MagickIcons/"
  install -m 644 magick-rotation-enabled.png "$pkgdir/usr/share/$pkgname/MagickIcons/"
  install -m 644 magick-rotation-enabled-touchoff.png "$pkgdir/usr/share/$pkgname/MagickIcons/"

  # Gnome-shell extension
  cd ../magick-rotation-extension
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$pkgname-extension"
  install -m 644 extension.js "$pkgdir/usr/share/gnome-shell/extensions/$pkgname-extension/"
  install -m 644 metadata.json "$pkgdir/usr/share/gnome-shell/extensions/$pkgname-extension/"
}
