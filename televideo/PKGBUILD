# Contributor: Klenje <adecorte@gmail.com>

pkgname=televideo
pkgver=0.45
pkgrel=3
pkgdesc="A program to check Italian RAI Teletext/Televideo"
arch=('i686' 'x86_64')
url="http://code.google.com/p/telenonvideo/"
license=('GPL3')
depends=('python2-pyqt>=4.5')
source=(http://telenonvideo.googlecode.com/files/Televideo-$pkgver.tar.gz)
md5sums=('47bae385c04458a477385460d8ee3241')
build() {
  cd $startdir/src
  install -D -m644 televideo/televideo.py $startdir/pkg/usr/lib/python2.7/site-packages/televideo/televideo.py
  cp -R televideo $startdir/pkg/usr/lib/python2.7/site-packages/
  install -D -m755 televideo.sh $startdir/pkg/usr/bin/televideo
  install -D -m644 televideo/icons/televideo.png $startdir/pkg/usr/share/icons/hicolor/32x32/apps/televideo.png
  install -D -m644 televideo.desktop $startdir/pkg/usr/share/applications/televideo.desktop
}
