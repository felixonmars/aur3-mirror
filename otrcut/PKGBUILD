# Maintainer: Max Roder <maxroder@web.de>

pkgname=otrcut
pkgver=20100701
pkgrel=3
pkgdesc="command line tool to automatically cut otr recordings"
arch=('any')
url="http://www.siggimania4u.de/otrcut.html"
license=('GPL')
depends=('avidemux')
optdepends=('transcode: to use avisplit/avimerge instead of avidemux'
	'mplayer: to use the "play" option (will play the video just after cutting)')
source=("http://www.siggimania4u.de/otrcut/otrcut.sh")
sha256sums=('e6ff046273e3ce5f980269e0642ec2f3555ab08f2207548e3d1165074f09f703')

package() {
  install -Dm 755 otrcut.sh ${pkgdir}/usr/bin/otrcut
}
