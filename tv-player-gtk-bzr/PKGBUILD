pkgname=tv-player-gtk-bzr
pkgver=95
pkgrel=1
pkgdesc="Tv-player development version"
arch=('i686' 'x86_64')
url="http://tvplayersite.altervista.org"
license=('GPL')
depends=('python' 'pygtk' 'python-gdata' 'flvstreamer' 'libmms' 'gstreamer0.10-python' 'gstreamer0.10-base' 'gstreamer0.10-good' 'gstreamer0.10-bad' 'gstreamer0.10-ugly' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-bad-plugins')
makedepends=("bzr")
source=("tv-player-bin" "tvplayer.desktop")
conflicts=("tv-player-gtk")
provides=("tv-player-gtk")
_bzrtrunk=lp:tv-player
_bzrbranch=tv-player

md5sums=('728d6b04a37bcf016f4b099ff5241910'
         '2fc59233b564cd58728edb36a34013a2')

package() {
  
  msg "Connecting to Launchpad..."
  cd $srcdir
  if [ -d $_bzrbranch ]; then
	cd $_bzrbranch && bzr up
  else
	bzr co $_bzrtrunk
  fi

  cd $srcdir/$_bzrbranch
  mkdir -p $pkgdir/usr/share/tvplayer
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp -r * $pkgdir/usr/share/tvplayer
  cd ..
  cp tvplayer.desktop $pkgdir/usr/share/applications/
  install -Dm755 tv-player-bin $pkgdir/usr/bin/tv-player
  install -Dm655 $srcdir/$_bzrbranch/pixmaps/tv-player.png $pkgdir/usr/share/tvplayer/pixmaps/tv-player.png
}
