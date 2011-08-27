# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=ora-thumbnailer-xfce
_pkgname=ora-thumbnailers
pkgver=0.1.0
pkgrel=1
pkgdesc="OpenRaster thumbnailer for XFCE (Thunar)"
arch=('any')
url="http://create.freedesktop.org/wiki/OpenRaster"
license=('LGPL')
depends=('pygtk')
_sourceroot=http://www.jonnor.com/files
source=($_sourceroot/$_pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('9ccf397807a00561fab5b11873a17106')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -D -m755 ora-thumbnailer.py \
        "$pkgdir"/usr/bin/ora-thumbnailer-xfce
  install -D -m644 xfce/ora-thumbnailer-xfce.desktop \
        "$pkgdir"/usr/share/thumbnailers/ora-thumbnailer-xfce.desktop

  # Fix to use python2, not python3
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        "$pkgdir"/usr/bin/ora-thumbnailer-xfce

}

# vim:set ts=2 sw=2 et:
