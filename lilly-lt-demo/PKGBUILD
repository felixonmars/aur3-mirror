# Maintainer: Ner0

pkgname=lilly-lt-demo
pkgver=1.0
pkgrel=1
pkgdesc="Lilly Looking Through, an animated adventure game (demo)"
arch=('i686' 'x86_64')
url="http://www.lillylookingthrough.com/"
license=('custom:commercial')
options=('!strip')
source=("https://s3.amazonaws.com/GeetaGames/LillyDemo.tar.gz" "$pkgname.desktop")
md5sums=('2deb884d0c50f74dc757d56079a72f6b'
         '70cc4f904d3308eb8a607a40d91384fd')
PKGEXT='.pkg.tar'

if [ "$CARCH" == 'i686' ]; then
   depends=('gtk2' 'pango' 'gdk-pixbuf2' 'cairo' 'libpng' 'libffi' 'curl' 'libxt' 'nss')
elif [ "$CARCH" == 'x86_64' ]; then
   depends=('lib32-gtk2' 'lib32-pango' 'lib32-gdk-pixbuf2' 'lib32-cairo' 'lib32-libpng' 'lib32-libffi' 'lib32-curl' 'lib32-libxt' 'lib32-nss')
fi

package () {
  install -dm755 "$pkgdir/opt/"

  cp -rf "$srcdir/LillyDemo/LillyLT" "$pkgdir/opt/$pkgname"

  # Installing launcher, desktop and icon
  install -Dm755 "$srcdir/LillyDemo/Lilly_Launch.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/LillyDemo/LillyIcon/LillyIcon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  sed -i 's|cd LillyLT|#!/bin/sh\ncd /opt/lilly-lt-demo/|' "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
