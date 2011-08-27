# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=pygowave-desktopclient
pkgver=0.1
pkgrel=1
pkgdesc="The PyGoWave DesktopClient"
arch=('i686' 'x86_64')
url="http://github.com/p2k/pygowave-qt"
license=('GPL')
depends=('qt' 'qjson' 'jswrapper' 'pygowave-api')
source=(http://github.com/p2k/pygowave-qt/tarball/$pkgname-$pkgver.tar.gz PyGoWaveDesktopClient.desktop)
md5sums=('ec489bb526259fdeb4605d009a9e39fb'
         '0443a9450f3d5affe71e28528a839d58')

build() {
  cd $srcdir/p2k-pygowave-qt-*

  qmake -config release || return 1
  make install INSTALL_ROOT=$pkgdir

  install -m 644 -D src/gui/icons/PyGoWave-16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/pygowave.png
  install -m 644 -D src/gui/icons/tray-online-22.png $pkgdir/usr/share/icons/hicolor/22x22/apps/pygowave.png
  install -m 644 -D src/gui/icons/PyGoWave-32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/pygowave.png
  install -m 644 -D src/gui/icons/PyGoWave-48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/pygowave.png
  install -m 644 -D src/gui/icons/PyGoWave-256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/pygowave.png
  install -m 644 -D $srcdir/PyGoWaveDesktopClient.desktop $pkgdir/usr/share/applications/PyGoWaveDesktopClient.desktop
}

# vim:set ts=2 sw=2 et:
