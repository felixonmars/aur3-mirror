# Maintainer: Jorge Lorenzo <jorgelg AT tid DOT es>
pkgname=istmusic
pkgver=1.0.0
pkgrel=1
pkgdesc="Context-aware self-adaptive middleware for mobile applications"
arch=(any)
url="http://ist-music.berlios.de"
license=(LGPL2.1)
depends=(java-runtime)
source=('istmusic.sh'
	'istmusic.desktop'
	'istmusic.png'
	"http://download.berlios.de/ist-music/music-middleware-bin-$pkgver.zip")
md5sums=('83a318791c9eeac8a0883e2e911b93f7'
         '1858e177fe6b4d4a86bb841174b825fe'
         'cecbdbb2ba7cbb77d897fad7c8cf560a'
         '7e46b6706dd6715702ce643ee04aced2')

build() {
  cd "$srcdir/music-middleware-bin-$pkgver" || return 1

  # Copy the binary structure
  mkdir -p "$pkgdir/usr/share/java/istmusic" || return 1
  cp -R * "$pkgdir/usr/share/java/istmusic" || return 1

  # Rename the linux configuration with the default name
  mv "$pkgdir/usr/share/java/istmusic/conf/config_linux.properties" "$pkgdir/usr/share/java/istmusic/conf/config.properties" || return 1

  # Remove the scripts
  rm "$pkgdir/usr/share/java/istmusic/felix.sh"
  rm "$pkgdir/usr/share/java/istmusic/felix.bat"

  # Copy the script to launch the MUSIC middleware
  cp "$srcdir/istmusic.sh" "$pkgdir/usr/share/java/istmusic" || return 1
  chmod 755 "$pkgdir/usr/share/java/istmusic/istmusic.sh"
  mkdir "$pkgdir/usr/bin" || return 1
  ln -s "../share/java/istmusic/istmusic.sh" "$pkgdir/usr/bin/istmusic" || return 1

  # Copy the icon and menu entry
  mkdir -p "$pkgdir/usr/share/applications" || return 1
  cp "$srcdir/istmusic.desktop" "$pkgdir/usr/share/applications" || return 1
  mkdir -p "$pkgdir/usr/share/pixmaps" || return 1
  cp "$srcdir/istmusic.png" "$pkgdir/usr/share/pixmaps" || return 1
}
