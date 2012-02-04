pkgname=tv-player-gtk
pkgver=1.0.5
pkgrel=3
pkgdesc="Tv-Player is an application written with the GTK graphic libraries that permit you to watch live TV and listen to live radio" 
arch=('any')
url="http://tvplayersite.altervista.org"
license=('GPL')
depends=('pygtk' 'python-gdata' 'flvstreamer' 'libmms' 'gstreamer0.10-python' 'gstreamer0.10-base' 'gstreamer0.10-good' 'gstreamer0.10-bad' 'gstreamer0.10-ugly' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-bad-plugins')
source=('http://launchpad.net/tv-player/stable/1.0.5/+download/tv-player-gtk_1.0.5.tar.gz' 'tvplayer.desktop')

md5sums=('159c32ac7279dbd38cbdddd8786f82a1'
         '2fc59233b564cd58728edb36a34013a2')

build() {
  cd $srcdir/tvplayer-1.0.5
  sed -i -e '3cenv python2 -O main-gtk.py' tv-player
  mkdir -p $pkgdir/usr/share/tvplayer
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp -r * $pkgdir/usr/share/tvplayer
  install -Dm644 $srcdir/tvplayer.desktop $pkgdir/usr/share/applications/
  install -Dm755 tv-player $pkgdir/usr/bin
  install -Dm655 pixmaps/tv-player.png $pkgdir/usr/share/tvplayer/pixmaps/tv-player.png
}

