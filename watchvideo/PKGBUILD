# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=watchvideo
pkgver=2.2.1
pkgrel=3
pkgdesc="Small application to play or download videos from various YouTube-like sites"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/WatchVideo?content=133133"
license=('GPL3')
depends=('getmediumurl' 'python2-pyqt4' 'python-urlreader' 'vlc')
source=(http://qt-apps.org/CONTENT/content-files/128368-WatchVideo-$pkgver.tar.gz)
md5sums=('f8bea1dab1534cb01f5c3f268536e0d3')

build() {
   cd $srcdir/WatchVideo-$pkgver

   python2 setup.py install --root=$pkgdir --optimize=1

   # Fix Desktop icon
   sed -i 's_GenericName=WatchVideo_GenericName=Youtube Player_' watchvideo.desktop

   # Desktop icon
   install -Dm644 ./media/watchvideo.svg $pkgdir/usr/share/pixmaps/watchvideo.svg
   install -Dm644 watchvideo.desktop $pkgdir/usr/share/applications/watchvideo.desktop
}