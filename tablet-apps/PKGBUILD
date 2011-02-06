# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: M Rawash <mrawash@gmail.com>
# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>

pkgname=tablet-apps
pkgver=0.3.1
pkgrel=3
pkgdesc="Gnome panel and control center applets to configure and monitor graphics tablet devices."
url="http://alexmac.cc/tablet-apps/"
license="GPL"
arch=('i686' 'x86_64')
depends=('gnome-python-desktop')
source=(http://alexmac.cc/tablet-apps/$pkgname-$pkgver.tar.bz2
        http://alexmac.cc/tablet-apps/$pkgname-addons.tar.gz)
md5sums=('6a7afd1b06941c5128f215c04d18c306'
         'efc5561c3e99f3f9010493fac2b656a9')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  # Make app more freedesktop compliant - DIRRRTY!!
  sed -i 's/\/usr\/share\/tablet-capplet\/input-tablet.svg/input-tablet/' tablet-capplet.desktop
  sed -i 's/set_from_file(\"\/usr\/share\/pressure-applet\/input-tablet.png\"/set_from_icon_name(\"input-tablet\",\ 16/' pressure-applet.py
  sed -i 's/gnome-main-menu/input-tablet/' pressure-applet.server
  # Addon package
  mv -f $srcdir/tablet-capplet.py $srcdir/$pkgname-$pkgver
  mv -f $srcdir/tablet-capplet.glade $srcdir/$pkgname-$pkgver
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' *.py 
  # Based on Makefile
  install -D pressure-applet.py $pkgdir/usr/bin/pressure-applet.py
  install -D -m644 pressure-applet.server $pkgdir/usr/lib/bonobo/servers/pressure-applet.server

  mkdir -p $pkgdir/usr/share/tablet-capplet
  cp tablet-capplet.glade $pkgdir/usr/share/tablet-capplet/

  install -D tablet-capplet.py $pkgdir/usr/bin/tablet-capplet.py
  install -D -m644 tablet-capplet.desktop $pkgdir/usr/share/applications/tablet-capplet.desktop
}
