# Maintainer: Ner0

pkgname=cinnamon-applet-screenshot-record
pkgver=1.4
pkgrel=2
pkgdesc="Lets you take screen shots and record your desktop"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/41"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon' 'ffmpeg' 'gnome-screenshot' 'libnotify' 'xdg-utils')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/C8JF-N1DJ-4TGL.zip")
md5sums=('2d743b453ec978a5a566380b0e4e657e')

package() {
  find ScreenShot+RecordDesktop\@tech71/ -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;

  cd "$pkgdir/usr/share/cinnamon/applets/ScreenShot+RecordDesktop@tech71"
  chmod +x screencapture.sh screencapturesound.sh
}
