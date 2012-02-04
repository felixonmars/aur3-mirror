# Contributor: Jens Grunert <jens.grunert@gmail.com>
pkgname=photostory
pkgver=1.0
pkgrel=2
pkgdesc="Photostory lets you take a picture of yourself every day, and compile them into a video, showing the story of your life as photos of you"
arch=('i686' 'x86_64')
url=http://launchpad.net/photostory
license=('GPL')
requires=('gtk2' 'python2' 'gstreamer0.10-python');
source=(http://launchpad.net/photostory/trunk/${pkgver}/+download/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('444d8aa2fdcd2d1caf67a8dc23cca5b8')

package () {
  sed -e 's/^#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory" > "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory.py2"
  install -D -m755 "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory.py2" "$pkgdir/usr/bin/photostory"
  sed -e 's/^#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory_reminder" > "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory_reminder.py2"
  install -D -m755 "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory_reminder.py2" "$pkgdir/usr/bin/photostory_reminder"
  install -D -m644 "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory.desktop" "$pkgdir/usr/share/applications/photostory.desktop"
  install -D -m644 "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory_reminder.desktop" "$pkgdir/etc/xdg/autostart/photostory_reminder.desktop"
  install -D -m644 "$srcdir/${pkgname}_${pkgver}-0ubuntu1.orig/photostory.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/photostory.svg"
}
