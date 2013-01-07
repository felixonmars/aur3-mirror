# Maintainer: Lael Guillemenot <zeppelinlg@gmail.com>
# Contributor: Lael Guillemenot <zeppelinlg@gmail.com>
pkgname=spotify-controller
pkgver=2.2
pkgrel=4
pkgdesc="Spotify Controller lets you control the real Spotify UI on your computer."
arch=('i686' 'x86_64')
url="https://play.google.com/store/apps/details?id=com.cewan.spotify"
license=('GPL')
depends=('spotify' 'java-runtime')
makedepends=('unzip')
source=("http://dl.dropbox.com/u/3072694/SpotifyController/SpotifyController.zip"
"${pkgname}"
"${pkgname}.desktop"
)
md5sums=('a103fb41a72f5e6b35e3b3cf1bce136b'
'13492e67b2b3ec1c5b006174f0de158d'
'22aaccd1d4cccf315fec8f69f7a6d5bb')

package() {
  cd "$srcdir/SpotifyController"
  install -Dm755 $srcdir/${pkgname} $pkgdir/usr/bin/${pkgname}
  install -Dm755 resources/KillSpotifyController $pkgdir/usr/bin/KillSpotifyController
  install -Dm644 resources/icon.png $pkgdir/usr/share/pixmaps/spotifycontroller.png
  install -Dm644 resources/icon_stop.png $pkgdir/usr/share/pixmaps/spotifycontroller_stop.png
  install -Dm644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
  install -Dm755 $srcdir/SpotifyController/server/spotifycontrollerservergui.jar $pkgdir/usr/lib/$pkgname/spotifycontrollerservergui.jar
}
